class OnboardingAccountEntry {
  const OnboardingAccountEntry({
    required this.nama,
    required this.saldoAwal,
  });

  final String nama;
  final double saldoAwal;
}

class OnboardingAssetEntry {
  const OnboardingAssetEntry({
    required this.namaAset,
    required this.jumlah,
    required this.hargaBeliRataRata,
  });

  final String namaAset;
  final double jumlah;
  final double hargaBeliRataRata;
}

class OnboardingDebtEntry {
  const OnboardingDebtEntry({
    required this.pemberiUtang,
    required this.saldoAwal,
  });

  final String pemberiUtang;
  final double saldoAwal;
}

class OnboardingReceivableEntry {
  const OnboardingReceivableEntry({
    required this.peminjam,
    required this.saldoAwal,
  });

  final String peminjam;
  final double saldoAwal;
}

class OnboardingProfileEntry {
  const OnboardingProfileEntry({
    required this.tanggalLahir,
    required this.rencanaUsiaPensiun,
    required this.rencanaUsiaWarisan,
    required this.anggotaKeluargaDitanggung,
    required this.pemasukanBulananRataRata,
    required this.pengeluaranBulananRataRata,
  });

  final DateTime tanggalLahir;
  final int rencanaUsiaPensiun;
  final int rencanaUsiaWarisan;
  final int anggotaKeluargaDitanggung;
  final double pemasukanBulananRataRata;
  final double pengeluaranBulananRataRata;
}

const onboardingStepTitles = [
  'Kas dan Tabungan',
  'Aset Setara Kas',
  'Aset Tidak Lancar',
  'Utang',
  'Piutang',
  'Kartu Kredit',
  'Rencana Keuangan',
];

const onboardingStepCount = 7;
