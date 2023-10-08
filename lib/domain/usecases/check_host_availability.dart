import 'package:dartz/dartz.dart';
import 'package:idwey/domain/repositories/host_repository.dart';
import 'package:idwey/domain/usecases/usecase.dart';

class CheckHostAvailabilityUseCase
    extends UseCase<Map<String, dynamic>, Map<String, dynamic>> {
  HostRepository repository;
  CheckHostAvailabilityUseCase(this.repository);

  @override
  Future<Either<Exception, Map<String, dynamic>>> call(
      Map<String, dynamic> params) async {
    print("params");
    print(params);
    return await repository.checkHostAvailability(
        params['id'],
        params['checkIn'],
        params['checkOut'],
        params['adults'],
        params['children']);
  }
}
