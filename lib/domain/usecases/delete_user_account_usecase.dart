import 'package:dartz/dartz.dart';
import 'package:idwey/domain/repositories/auth_repository.dart';
import 'package:idwey/domain/usecases/usecase.dart';

class DeleteUserUseCase extends UseCase<dynamic, Map<String, dynamic>> {
  AuthRepository repository;
  DeleteUserUseCase(this.repository);

  @override
  Future<Either<Exception, void>> call(Map<String, dynamic> params) async {
    print("params");
    print(params);
    return await repository.logout();
  }
}
