import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Exception, Map<String, dynamic>>> login(
      Map<String, dynamic> params);

  Future<Either<Exception, Map<String, dynamic>>> signUp(
      Map<String, dynamic> params);
}
