import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/product_details_dto.dart';
import 'package:idwey/domain/repositories/auth_repository.dart';
import 'package:idwey/domain/repositories/product_repository.dart';

import 'usecase.dart';

/// get event details usecase

class LoginUseCase extends UseCase<Map<String, dynamic>, Map<String, dynamic>> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Exception, Map<String, dynamic>>> call(
      Map<String, dynamic> params) async {
    return await authRepository.login(params);
  }
}
