import 'package:dartz/dartz.dart';
import 'package:idwey/data/data_sources/auth_api_data_source.dart';
import 'package:idwey/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthApiDataSource dataSource;
  AuthRepositoryImpl(this.dataSource);
  @override
  Future<Either<Exception, Map<String, dynamic>>> login(
      Map<String, dynamic> params) async {
    try {
      final result = await dataSource.login(params);
      print("result");
      print(result);
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
      print("result");
      print(result);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
