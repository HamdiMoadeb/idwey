import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/host_dto.dart';
import 'package:idwey/domain/repositories/repositories.dart';

import 'usecase.dart';

class GetListHostsUseCase
    implements UseCase<List<Host>?, Map<String, dynamic>> {
  final HostRepository repository;

  GetListHostsUseCase(this.repository);

  @override
  Future<Either<Exception, List<Host>>> call(Map<String, dynamic> body) async {
    return await repository.getListHosts(body['limit'], body['offset']);
  }
}
