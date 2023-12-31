import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthApiDataSource {
  /// login
  /// sign up
  /// logout
  Future<Map<String, dynamic>> login(Map<String, dynamic> params);
  Future<Map<String, dynamic>> signUp(Map<String, dynamic> params);
  Future<String> updateUser(Map<String, dynamic> params);
  Future<void> uploadImage(Map<String, dynamic> params);
  Future<void> logout();
}

class AuthApiDataSourceImpl implements AuthApiDataSource {
  final Dio dio;

  AuthApiDataSourceImpl(this.dio);

  @override
  Future<Map<String, dynamic>> login(Map<String, dynamic> params) async {
    try {
      var url = 'https://idwey.tn/api/login';
      var response = await dio.post(
        url,
        data: params,
      );

      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? id = prefs.getString('userId');

      final result = await dio.post("https://idwey.tn/api/user/delete/$id");
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Map<String, dynamic>> signUp(Map<String, dynamic> params) async {
    try {
      var url = 'https://idwey.tn/api/register';
      var response = await dio.post(url, data: params);

      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> updateUser(Map<String, dynamic> params) async {
    try {
      var url = 'https://idwey.tn/api/user/updateSetting';
      var response = await dio.put(url, data: params);

      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> uploadImage(Map<String, dynamic> params) async {
    try {
      final formData = FormData.fromMap(params);

      final response = await dio.post(
        'https://idwey.tn/api/user/image',
        data: formData,
      );

      // Handle the API response here
    } catch (e) {
      // Handle errors
    }
  }
}
