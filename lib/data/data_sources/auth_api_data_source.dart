import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthApiDataSource {
  /// login
  /// sign up
  /// logout
  Future<Map<String, dynamic>> login(Map<String, dynamic> params);
  Future<Map<String, dynamic>> signUp(Map<String, dynamic> params);
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

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      print("token111111111");
      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> signUp(Map<String, dynamic> params) async {
    try {
      var url = 'https://idwey.tn/api/register';
      var response = await dio.post(url, data: params);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      print("token111111111");
      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }
}
