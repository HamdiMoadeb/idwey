import 'package:dartz/dartz.dart';
import 'package:idwey/domain/repositories/host_repository.dart';
import 'package:idwey/domain/usecases/usecase.dart';

class CheckHostAvailabilityUseCase
    extends UseCase<dynamic, Map<String, dynamic>> {
  HostRepository repository;
  CheckHostAvailabilityUseCase(this.repository);

  @override
  Future<Either<Exception, dynamic>> call(Map<String, dynamic> params) async {
    return await repository.checkHostAvailability(
        params['type'],
        params['id'],
        params['checkIn'],
        params['checkOut'],
        params['adults'],
        params['children']);
  }
}
