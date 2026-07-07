import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';

part 'profile_repository.g.dart';

class ProfileRepository {
  ProfileRepository(this._dio);

  final Dio _dio;
  static final _dateFormatter = DateFormat('yyyy-MM-dd');

  Future<void> updateProfile({
    required DateTime tanggalLahir,
    required int rencanaUsiaPensiun,
    required int rencanaUsiaWarisan,
    required int anggotaKeluargaDitanggung,
    required double pemasukanBulananRataRata,
    required double pengeluaranBulananRataRata,
  }) async {
    try {
      await _dio.put<void>(
        '/api/profile',
        data: {
          'tanggalLahir': _dateFormatter.format(tanggalLahir),
          'rencanaUsiaPensiun': rencanaUsiaPensiun,
          'rencanaUsiaWarisan': rencanaUsiaWarisan,
          'anggotaKeluargaDitanggung': anggotaKeluargaDitanggung,
          'pemasukanBulananRataRata': pemasukanBulananRataRata,
          'pengeluaranBulananRataRata': pengeluaranBulananRataRata,
        },
      );
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }
}

@riverpod
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepository(ref.watch(apiClientProvider));
}
