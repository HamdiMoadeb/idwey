import 'package:dartz/dartz.dart';
import 'package:idwey/domain/repositories/auth_repository.dart';

import 'usecase.dart';

/// get event details usecase

class RegisterUseCase
    extends UseCase<Map<String, dynamic>, Map<String, dynamic>> {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  @override
  Future<Either<Exception, Map<String, dynamic>>> call(
      Map<String, dynamic> params) async {
    return await authRepository.signUp(params);
  }
}
