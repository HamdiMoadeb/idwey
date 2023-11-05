import 'package:dartz/dartz.dart';
import 'package:idwey/domain/repositories/auth_repository.dart';
import 'package:idwey/domain/usecases/usecase.dart';

class UpdateUserUseCase implements UseCase<String, Map<String, dynamic>> {
  final AuthRepository repository;

  UpdateUserUseCase(this.repository);

  @override
  Future<Either<Exception, String>> call(Map<String, dynamic> body) async {
    return await repository.updateUser(body);
  }
}
