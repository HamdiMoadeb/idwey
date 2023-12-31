import 'package:dio/dio.dart';

abstract class FidelityProgramApiDataSource {
  Future<Map<String, dynamic>> getMonthlyPoint(String userId);
  Future<Map<String, dynamic>> getTotalPoint(String userId);
}

class FidelityProgramApiDataSourceImpl implements FidelityProgramApiDataSource {
  final Dio dio;

  FidelityProgramApiDataSourceImpl(this.dio);

  @override
  Future<Map<String, dynamic>> getMonthlyPoint(String userId) async {
    try {
      final response =
          await dio.get("https://idwey.tn/api/user/monthpoint/$userId");

      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getTotalPoint(String userId) async {
    try {
      final response =
          await dio.get("https://idwey.tn/api/user/totalpoint/$userId");

      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }
}
