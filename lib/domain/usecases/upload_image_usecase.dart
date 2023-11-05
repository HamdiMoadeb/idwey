import 'package:dartz/dartz.dart';
import 'package:idwey/domain/repositories/auth_repository.dart';
import 'package:idwey/domain/usecases/usecase.dart';

class UploadImageUseCase implements UseCase<void, Map<String, dynamic>> {
  final AuthRepository repository;

  UploadImageUseCase(this.repository);

  @override
  Future<Either<Exception, void>> call(Map<String, dynamic> body) async {
    return await repository.uploadImage(body);
  }
}
