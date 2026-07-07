# Panduan Pembangunan — Wealth Checker Mobile (Flutter)
### Mengonsumsi API Wealth Checker yang Sudah Ada

Dokumen ini adalah panduan teknis untuk membangun aplikasi mobile Flutter yang mengonsumsi backend API Wealth Checker (`apps/api`) yang sudah selesai dibangun untuk web app (Next.js). Tidak ada perubahan skema database atau business logic baru — Flutter app ini murni **API consumer** baru, memakai backend yang sama persis dengan web.

Prasyarat: perubahan Bearer Auth di backend (lihat `Cursor_Prompt_Bearer_Auth.md`) sudah diterapkan dan di-deploy sebelum mulai Sprint 1 di bawah.

---

## 0. Keputusan Arsitektur Sebelum Mulai

| Keputusan | Pilihan | Alasan |
|---|---|---|
| State management | **Riverpod** (`flutter_riverpod` + `riverpod_annotation`) | Dependency graph dengan `ref.invalidate()` pas untuk household switching (lihat §1); `AsyncValue` built-in cocok untuk loading/error/data state yang konsisten di semua halaman |
| Networking | `dio` | Interceptor untuk auto-attach bearer token, retry, dan logging jauh lebih mudah dibanding `http` package |
| Auth storage | `flutter_secure_storage` | Token bearer tidak boleh disimpan di `SharedPreferences` biasa (plaintext) |
| Routing | `go_router` (+ `riverpod` refresh listenable) | Auth guard bereaksi otomatis ke perubahan state auth dari Riverpod |
| Chart | `fl_chart` | Ringan, cukup untuk line chart (kekayaan bersih) dan donut chart (budgeting/pemasukan) |
| Form | `flutter_form_builder` + `form_builder_validators` | Wizard onboarding 7 langkah butuh validasi konsisten antar step |
| Push notification | `firebase_messaging` | Backend `notificationScheduler.ts` sudah siap menerima FCM token |
| Package/module structure | Feature-first (bukan layer-first) | Memudahkan kerja paralel per modul, konsisten dengan pembagian route API |

**Kenapa Riverpod, bukan BLoC:** household switching (ganti household aktif via header `X-Household-Id`) perlu me-refresh hampir semua data sekaligus — accounts, transactions, debts, wealth summary, dst. Di Riverpod ini satu baris: `ref.invalidate(activeHouseholdIdProvider)`, dan setiap provider yang bergantung padanya (lewat `ref.watch`) otomatis fetch ulang. Ini dijelaskan konkret di §1 dan §4.

---

## 1. Struktur Proyek

```
wealth_checker_mobile/
├── lib/
│   ├── main.dart
│   ├── app.dart                      # MaterialApp + router + theme, dibungkus ProviderScope
│   ├── core/
│   │   ├── network/
│   │   │   ├── api_client.dart       # dio instance + base URL, provider: apiClientProvider
│   │   │   ├── auth_interceptor.dart # attach Authorization: Bearer <token> + Origin + X-Household-Id
│   │   │   └── api_exception.dart    # error mapping dari response backend
│   │   ├── storage/
│   │   │   └── secure_storage_service.dart  # simpan/ambil token, provider: secureStorageProvider
│   │   ├── router/
│   │   │   └── app_router.dart       # go_router config + auth guard berbasis authStateProvider
│   │   └── theme/
│   │       └── app_theme.dart        # warna, tipografi (samakan dgn web app)
│   ├── features/
│   │   ├── auth/
│   │   ├── onboarding/
│   │   ├── dashboard/
│   │   ├── transactions/
│   │   ├── accounts/
│   │   ├── debts_receivables/
│   │   ├── assets/
│   │   ├── budgeting/
│   │   ├── health_checkup/
│   │   ├── analytics/
│   │   ├── dream_tracker/
│   │   ├── retirement_plan/
│   │   ├── notifications/
│   │   ├── household/
│   │   └── export/
│   └── shared/
│       ├── widgets/                  # button, card, empty state, dll
│       ├── providers/
│       │   └── active_household_provider.dart  # provider global, root dependency graph
│       └── models/                   # model bersama (mis. Money formatter)
└── pubspec.yaml
```

Setiap folder di `features/` mengikuti pola Riverpod standar:
```
features/transactions/
├── data/
│   ├── models/                       # freezed/json_serializable model dari response API
│   └── repository.dart               # panggil api_client, return model — provider: transactionsRepositoryProvider
└── presentation/
    ├── providers/
    │   ├── transactions_list_provider.dart   # @riverpod AsyncNotifier — list + filter + pagination
    │   └── transaction_form_provider.dart    # @riverpod Notifier — state form submit
    ├── pages/
    └── widgets/
```

**Pola dependency graph inti** (contoh nyata household-invalidation — ini yang mendasari keputusan §0):

```dart
// shared/providers/active_household_provider.dart
@riverpod
class ActiveHouseholdId extends _$ActiveHouseholdId {
  @override
  String? build() => null; // null = pakai default household dari backend

  void switchTo(String householdId) {
    state = householdId;
    // Semua provider yang ref.watch(activeHouseholdIdProvider) otomatis
    // rebuild — TIDAK perlu invalidate manual satu-satu.
  }
}

// features/dashboard/presentation/providers/wealth_summary_provider.dart
@riverpod
Future<WealthSummary> wealthSummary(WealthSummaryRef ref) async {
  final householdId = ref.watch(activeHouseholdIdProvider); // rebuild otomatis saat household ganti
  final repo = ref.watch(wealthRepositoryProvider);
  return repo.getSummary(householdId: householdId);
}
```

Bandingkan dengan BLoC: perlu `RepositoryProvider` + event `HouseholdChanged` yang di-broadcast manual ke setiap BLoC (`DashboardBloc`, `TransactionsBloc`, `DebtsBloc`, dst) yang butuh tahu perubahan ini.

**Pola `auth_interceptor.dart`** (tiga header wajib, terverifikasi lewat testing Postman langsung ke production):

```dart
// core/network/auth_interceptor.dart
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this.ref);
  final Ref ref;

  // Origin custom scheme untuk mobile — harus persis sama dengan yang
  // didaftarkan di trustedOrigins backend (lihat Cursor_Prompt_Mobile_Origin.md).
  // Tanpa header ini, Better Auth menolak SEMUA request POST/PATCH/DELETE
  // dengan 403 MISSING_OR_NULL_ORIGIN — bukan cuma saat login.
  static const _mobileOrigin = "app://wealth-checker-mobile";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await ref.read(secureStorageProvider).readToken();
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    options.headers["Origin"] = _mobileOrigin;

    final householdId = ref.read(activeHouseholdIdProvider);
    if (householdId != null) {
      options.headers["X-Household-Id"] = householdId;
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      ref.read(authStateProvider.notifier).setUnauthenticated();
    }
    handler.next(err);
  }
}
```

---

## 2. Setup Awal (Sprint 0)

- [ ] `flutter create wealth_checker_mobile` dengan org id yang sesuai (mis. `cloud.velrox.wealthchecker`)
- [ ] Tambah dependencies inti ke `pubspec.yaml`:
  ```yaml
  dependencies:
    dio: ^5.x
    flutter_riverpod: ^2.x
    riverpod_annotation: ^2.x
    go_router: ^14.x
    flutter_secure_storage: ^9.x
    fl_chart: ^0.x
    flutter_form_builder: ^9.x
    form_builder_validators: ^11.x
    firebase_messaging: ^15.x
    firebase_core: ^3.x
    intl: ^0.19.x          # format Rupiah, tanggal
    freezed_annotation: ^2.x
    json_annotation: ^4.x
  dev_dependencies:
    build_runner: ^2.x
    riverpod_generator: ^2.x
    riverpod_lint: ^2.x
    custom_lint: ^0.x
    freezed: ^2.x
    json_serializable: ^6.x
  ```
- [ ] Setup `api_client.dart` — base URL dari `--dart-define=API_BASE_URL` (jangan hardcode, beda untuk dev/staging/prod); expose lewat `@riverpod Dio apiClient(ApiClientRef ref)`
- [ ] Setup `auth_interceptor.dart` — baca token dari secure storage via `ref.read(secureStorageProvider)`, attach ke SETIAP request tiga header berikut:
  - `Authorization: Bearer <token>`
  - `Origin: app://wealth-checker-mobile` (**wajib** — Better Auth memvalidasi header `Origin` untuk semua request POST/PATCH/DELETE sebagai proteksi CSRF, bukan cuma saat login. Tanpa ini, semua mutasi akan ditolak 403 `MISSING_OR_NULL_ORIGIN`, terverifikasi langsung lewat testing Postman: sign-out baru berhasil setelah header `Origin` ditambahkan manual. Nilai ini harus persis sama dengan yang didaftarkan di `trustedOrigins` backend — lihat `Cursor_Prompt_Mobile_Origin.md`)
  - `X-Household-Id` (dari `ref.read(activeHouseholdIdProvider)`, kalau ada)
  - Kalau dapat 401, set `authStateProvider` ke `unauthenticated` (router akan auto-redirect, lihat §3)
- [ ] Setup tema dasar (`app_theme.dart`) — samakan palet warna dengan web app (`globals.css` di `apps/web`) supaya brand konsisten
- [ ] Setup Firebase project (untuk push notification nanti) — daftarkan Android & iOS app, download `google-services.json` / `GoogleService-Info.plist`
- [ ] Bungkus `main.dart` dengan `ProviderScope`, jalankan `dart run build_runner watch -d` selama development (wajib untuk `@riverpod` code generation)

---

## 3. Sprint 1 — Auth (Login & Register)

Endpoint terkait: `POST /api/auth/sign-up/email`, `POST /api/auth/sign-in/email`, `POST /api/auth/sign-out`, `GET /api/auth/session`

- [ ] Halaman Login: form email + password, validasi client-side dasar
- [ ] Halaman Register: form email + password + nama
- [ ] Setelah sign-in/sign-up sukses, backend mengembalikan token lewat header `set-auth-token` (setelah perubahan Bearer Auth diterapkan) — simpan ke `flutter_secure_storage`
- [ ] `@riverpod class AuthState extends _$AuthState` — `AsyncValue<AuthStatus>` (`authenticated` / `unauthenticated`), di-build dari `GET /api/auth/session` saat app start
- [ ] Auth guard di `go_router` — pakai `refreshListenable` yang mendengarkan `authStateProvider` (via `ref.listen` dibungkus `Listenable` adapter, atau pakai package `go_router_riverpod` kalau mau lebih ringkas); redirect ke `/login` kalau `unauthenticated`, ke `/onboarding` atau `/dashboard` kalau `authenticated` (cek `wealthLevel === -1` dari provider `wealthSummaryProvider` untuk tahu apakah user baru — pola ini sama seperti yang dipakai web app di `auth/login/page.tsx`)
- [ ] Logout: panggil `POST /api/auth/sign-out`, hapus token dari secure storage, set `authStateProvider` ke `unauthenticated` (router auto-redirect)

---

## 4. Sprint 2 — Dashboard & Wealth Summary (Read-Only)

Endpoint terkait: `GET /api/wealth/summary`, `GET /api/wealth/monthly-cash-flow`

Mulai dari sini karena paling sederhana (read-only) — bagus untuk validasi arsitektur networking dan pola provider sebelum masuk ke modul yang lebih kompleks.

- [ ] `@riverpod Future<WealthSummary> wealthSummary(...)` — fetch `GET /api/wealth/summary`, tampilkan kekayaan bersih, level (0-6), breakdown Uang/Barang/Utang
- [ ] Widget consumer pakai `.when(data: ..., loading: ..., error: ...)` dari `AsyncValue` — pola ini dipakai konsisten di SEMUA halaman berikutnya, jadi mantapkan komponen loading/error/empty state generik di `shared/widgets/` sekarang
- [ ] Widget badge level kekayaan (samakan style dengan web app: `health-checkup/page.tsx` sudah punya pola warna per level yang bisa dicontoh)
- [ ] Card ringkasan rekening
- [ ] Section "Sisa Uang Bulanan" dari `GET /api/wealth/monthly-cash-flow`
- [ ] Empty state khusus untuk `wealthLevel === -1` (user belum onboarding) — arahkan ke halaman onboarding
- [ ] Pull-to-refresh: panggil `ref.invalidate(wealthSummaryProvider)` — konfirmasi pola ini bekerja sebelum lanjut ke sprint berikutnya, karena pola yang sama dipakai di mana-mana

---

## 5. Sprint 3 — Manajemen Rekening (Accounts)

Endpoint terkait: `GET/POST/PATCH/DELETE /api/accounts`, `GET /api/accounts/:id/mutasi`

- [ ] `@riverpod class AccountsList extends _$AccountsList` (AsyncNotifier) — list rekening aktif, dengan method `addAccount()`, `updateAccount()`, `deleteAccount()` yang memanggil repository lalu `ref.invalidateSelf()` untuk refresh list
- [ ] Form tambah/edit rekening
- [ ] Halaman Mutasi Rekening — histori transaksi per rekening dengan running balance, filter tanggal (provider terpisah, `family` parameter berdasarkan `accountId`)
- [ ] Guard UI: tampilkan pesan jelas kalau backend menolak hapus rekening yang masih ada transaksi terkait (409 Conflict) — tangkap di `AsyncNotifier` method, expose sebagai state error yang bisa dibaca UI tanpa melempar exception mentah ke widget

---

## 6. Sprint 4 — Onboarding Wizard

Endpoint terkait: kombinasi `POST /api/accounts`, `POST /api/assets` (liquid & fixed), `POST /api/debts`, `POST /api/debts/receivables`, `PUT /api/profile`

- [ ] Wizard 7 langkah dengan `PageView` + indikator progress:
  1. Kas dan Tabungan (multi-rekening)
  2. Aset Setara Kas
  3. Aset Tidak Lancar
  4. Utang
  5. Piutang
  6. Kartu Kredit
  7. Rencana Sisa Uang Bulanan + Rencana Pensiun & Warisan (via `PUT /api/profile`)
- [ ] `@riverpod class OnboardingWizard extends _$OnboardingWizard` — Notifier menyimpan step index aktif + status submit per step
- [ ] Simpan progress per step langsung ke backend saat klik "Lanjut" (bukan simpan semua di akhir) — ikuti pola yang sudah dipakai web app (lihat commit `90bf3b6 fix(onboarding): simpan data per-step langsung ke DB saat klik Lanjut`), supaya kalau user keluar di tengah jalan, datanya tidak hilang
- [ ] Setelah wizard selesai, `ref.invalidate(wealthSummaryProvider)` lalu redirect ke Dashboard

---

## 7. Sprint 5 — Transaction Tracking (Prioritas UX Tertinggi)

Endpoint terkait: `GET/POST/PATCH/DELETE /api/transactions`, `GET /api/transactions/categories`

Ini modul paling sering dipakai — investasikan waktu ekstra di sini.

- [ ] Floating Action Button "Quick Add" dari Dashboard — bottom sheet pilih jenis transaksi (Pendapatan/Pengeluaran/Transfer dulu, jenis lain menyusul di sprint berikutnya)
- [ ] Form catat transaksi dengan autocomplete kategori dari `@riverpod Future<List<String>> transactionCategories(...)` (histori kategori yang pernah dipakai user, endpoint `GET /api/transactions/categories`)
- [ ] `@riverpod class TransactionsList extends _$TransactionsList` — AsyncNotifier dengan filter (tanggal, kategori, rekening) sebagai parameter `family`, dan pagination lewat method `loadMore()`
- [ ] Edit & hapus transaksi — setelah sukses, `ref.invalidateSelf()` pada list DAN `ref.invalidate(wealthSummaryProvider)` (karena transaksi baru mengubah kekayaan bersih — ini keuntungan lain dependency graph: cukup invalidate provider terkait, tidak perlu manual "refresh callback" antar halaman)
- [ ] Validasi saldo negatif — tampilkan warning sebelum submit kalau backend akan menolak (cek respons 422 dari backend)

---

## 8. Sprint 6 — Utang & Piutang

Endpoint terkait: `GET/POST/PATCH/DELETE /api/debts`, `GET/POST /api/debts/receivables` (cek path pasti di `docs/API.md` §5)

- [ ] List utang aktif + ringkasan per pemberi utang (progress pelunasan) — `@riverpod` AsyncNotifier
- [ ] Form tambah utang baru + form catat pembayaran cicilan
- [ ] List piutang aktif + ringkasan per peminjam
- [ ] Form tambah piutang baru + form catat penerimaan pembayaran
- [ ] Setiap mutasi sukses → invalidate provider list terkait + `wealthSummaryProvider`

---

## 9. Sprint 7 — Aset (Beli/Jual Barang & Investasi)

Endpoint terkait: `GET/POST /api/assets` (liquid & fixed, lihat `docs/API.md` §4)

- [ ] List Aset Tidak Lancar (barang) dengan harga beli rata-rata otomatis dari backend
- [ ] List Investasi (Aset Setara Kas) dengan harga beli rata-rata otomatis
- [ ] Form beli barang/investasi — tampilkan harga_beli_rata_rata terkini saat pilih nama item yang sudah ada
- [ ] Form jual barang/investasi — tampilkan estimasi untung/rugi live sebelum submit (kalkulasi di client mengikuti formula `(harga_jual - harga_beli_rata_rata) × jumlah` untuk preview, tapi tetap kirim raw input ke backend sebagai source of truth)
- [ ] Guard: validasi jumlah jual tidak melebihi yang dimiliki (backend juga validasi ini, tapi cek di client dulu untuk UX lebih responsif)
- [ ] Invalidate `wealthSummaryProvider` setelah beli/jual sukses (nilai aset ikut berubah)

---

## 10. Sprint 8 — Financial Health Check-up & Budgeting Advisor

Endpoint terkait: `GET /api/wealth/health-checkup`, `POST/GET /api/budget-plans`, `GET /api/budgeting-advice`

- [ ] Halaman Health Check-up: level badge + diagnosa + 3 ciri + saran (styling sama dengan web app) — provider ini idealnya `ref.watch` ke level yang sama dengan `wealthSummaryProvider` supaya konsisten kalau level berubah
- [ ] Halaman Budgeting Advisor: input rencana pemasukan bulanan, tampilkan 4 kartu alokasi budget sesuai level

---

## 11. Sprint 9 — Analytics (Chart-Chart)

Endpoint terkait: `GET /api/wealth/wealth-history`, `GET /api/analytics/monthly-pl`, `GET /api/analytics/budget-vs-actual`, `GET /api/analytics/emergency-fund`, `GET /api/analytics/essential-expenses`, `GET /api/analytics/income`

- [ ] `@riverpod class AnalyticsDateFilter extends _$AnalyticsDateFilter` — Notifier tunggal untuk rentang tanggal (Dari–Sampai) yang di-`ref.watch` oleh SEMUA provider sub-laporan di bawah, dengan preset cepat (Bulan ini, 3/6 Bulan Terakhir, Tahun ini) — ganti filter sekali, semua chart refresh otomatis (pola dependency graph yang sama seperti household)
- [ ] Line chart Kekayaan Bersih (`fl_chart` LineChart) dari `wealth-history`
- [ ] Bar/tabel Laba Rugi Bulanan
- [ ] Tabel + donut chart Budgeting Aktual vs Rencana
- [ ] Card Dana Darurat
- [ ] Breakdown Kebutuhan Pokok (tabel per kategori)
- [ ] Donut chart Pemasukan per sumber

---

## 12. Sprint 10 — Dream Tracker & Retirement Plan

Endpoint terkait: `GET/POST/PATCH/DELETE /api/dream-goals`, `GET /api/wealth/retirement-plan`, `GET/PATCH /api/wealth/retirement-assumptions`

- [ ] List Dream Goals dengan progress bar (card per goal)
- [ ] Form tambah/edit goal — pilihan link ke rekening atau saldo manual
- [ ] Halaman Retirement Plan: toggle mode Simple/Advanced (present value) — simpan pilihan mode di Notifier lokal halaman ini, tampilkan hasil kalkulasi dari provider terpisah per mode

---

## 13. Sprint 11 — Notifikasi Push

Endpoint terkait: `POST/DELETE /api/notifications/subscribe`, `GET/PATCH /api/notifications/preferences`, `POST /api/notifications/test`

- [ ] Setup `firebase_messaging` — minta permission notifikasi (khususnya penting untuk iOS)
- [ ] Ambil FCM token, kirim ke `POST /api/notifications/subscribe`
- [ ] Halaman Settings: toggle aktif/nonaktif pengingat + time picker jam pengingat → `PATCH /api/notifications/preferences` (provider Notifier sederhana, optimistic update lalu rollback kalau gagal)
- [ ] Tombol "Test Notifikasi" → `POST /api/notifications/test`
- [ ] Handle notification tap — deep link ke halaman transaksi (buka form quick-add langsung)

---

## 14. Sprint 12 — Household (Opsional, Multi-User)

Endpoint terkait: seluruh `docs/API.md` §13 (`/api/households/*`)

Pertimbangkan apakah fitur ini benar-benar dibutuhkan di mobile dulu, atau cukup dikelola dari web untuk versi awal. Kalau mau di-mobile-kan:

- [ ] Household switcher di app bar — pakai `activeHouseholdIdProvider` yang sudah dibuat di §1/Sprint 0; memanggil `.switchTo(id)` otomatis me-refresh seluruh dashboard, transaksi, dan halaman lain yang bergantung padanya tanpa kode tambahan apa pun
- [ ] Halaman kelola member: list + role, form invite, tombol keluar/hapus household
- [ ] Handle penerimaan invite (mungkin via deep link dari email)

---

## 15. Sprint 13 — Export & Polish

Endpoint terkait: `GET /api/export/pdf`, `GET /api/export/excel`

- [ ] Tombol export dari halaman Analytics — untuk mobile, pertimbangkan langsung buka file hasil download di viewer bawaan OS atau share ke aplikasi lain (`share_plus` package), daripada render PDF di dalam app
- [ ] Review UX keseluruhan: loading state, error state, empty state konsisten di semua halaman — karena semua provider pakai `AsyncValue`, ini seharusnya sudah otomatis konsisten kalau widget generik dari Sprint 2 dipakai ulang di semua tempat
- [ ] App icon, splash screen, dan branding final
- [ ] Testing di device fisik Android & iOS (bukan cuma emulator)
- [ ] Setup CI (opsional): `flutter test` + `flutter build` di GitHub Actions, mengikuti pola `deploy.yml` yang sudah ada untuk web/api — tambahkan `dart run build_runner build --delete-conflicting-outputs` sebelum test/build karena proyek ini pakai code generation (`@riverpod`, `@freezed`)

---

## Catatan Penting

**Reuse, jangan reinvent.** Setiap kali bingung soal format response atau validasi field tertentu, cek dulu `docs/API.md` (kontrak resmi) dan halaman web app yang sesuai di `apps/web/src/app/(app)/` — styling, copy teks Bahasa Indonesia, dan aturan validasi sudah final di sana, tinggal diterjemahkan ke widget Flutter.

**Urutan sprint di atas boleh disesuaikan** dengan prioritas kamu, tapi Sprint 0-2 (setup, auth, dashboard read-only) sebaiknya tetap di awal karena semua sprint berikutnya bergantung pada fondasi networking, auth, dan pola provider yang solid.

**Household context.** Kalau kamu skip Sprint 12 (household di mobile) untuk versi awal, tetap pastikan `auth_interceptor.dart` mengirim header `X-Household-Id` dari `activeHouseholdIdProvider` kalau backend mengharuskannya untuk endpoint tertentu — cek dulu apakah backend auto-fallback ke household default kalau header tidak dikirim (dari review kode sebelumnya, middleware `resolveHousehold` memang auto-fallback ke household pertama user, jadi aman untuk di-skip di awal; `activeHouseholdIdProvider` cukup `build()` mengembalikan `null` sampai Sprint 12 benar-benar dikerjakan).

**Code generation wajib jalan.** Karena arsitektur ini pakai `@riverpod` annotation (bukan manual `Provider(...)`), jangan lupa `dart run build_runner watch -d` aktif selama development — kalau lupa, error yang muncul biasanya "file `.g.dart` not found" yang membingungkan kalau belum terbiasa.

**Sudah terverifikasi via Postman terhadap production (6 Juli 2026):** flow sign-in → dapat token dari response body → pakai token + header Origin untuk request lain → sign-out, semuanya sukses. Detail tiga header wajib (`Authorization`, `Origin`, `X-Household-Id`) ada di contoh kode `auth_interceptor.dart` di §1. Jangan skip header `Origin` — tanpa itu semua mutasi (POST/PATCH/DELETE) akan gagal 403, hal ini sempat kejadian nyata saat testing dan baru resolved setelah header ditambahkan manual.
