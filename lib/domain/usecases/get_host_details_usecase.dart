import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/host_details_dto.dart';
import 'package:idwey/domain/repositories/repositories.dart';

import 'usecase.dart';

class GetHostUseCase implements UseCase<HostDetails, Map<String, dynamic>> {
  final HostRepository repository;

  GetHostUseCase(this.repository);

  @override
  Future<Either<Exception, HostDetails>> call(Map<String, dynamic> body) async {
    return await repository.getHost(body['id']);
  }
}
