import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:idwey/data/data_sources/auth_api_data_source.dart';
import 'package:idwey/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthApiDataSource dataSource;
  AuthRepositoryImpl(this.dataSource);
  @override
  Future<Either<Exception, Map<String, dynamic>>> login(
      Map<String, dynamic> params) async {
    try {
      final result = await dataSource.login(params);
      var body = jsonDecode(jsonEncode(result));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (body != null && body.keys.contains('token')) {
        await prefs.setString("token", body['token']);
      }

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> signUp(
      Map<String, dynamic> params) async {
    try {
      final result = await dataSource.signUp(params);
      Map<String, dynamic> body = jsonDecode(jsonEncode(result));
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (body.keys.contains('token')) {
        await prefs.setString("token", body['token']);
      }

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, String>> updateUser(
      Map<String, dynamic> params) async {
    try {
      final result = await dataSource.updateUser(params);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, void>> uploadImage(
      Map<String, dynamic> params) async {
    try {
      final result = await dataSource.uploadImage(params);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, void>> logout() async {
    try {
      final result = await dataSource.logout();

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
