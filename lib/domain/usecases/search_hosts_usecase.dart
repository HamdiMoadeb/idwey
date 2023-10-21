import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/host_dto.dart';
import 'package:idwey/domain/repositories/repositories.dart';

import 'usecase.dart';

class SearchListHostsUseCase
    implements UseCase<List<Host>?, Map<String, dynamic>> {
  final HostRepository repository;

  SearchListHostsUseCase(this.repository);

  @override
  Future<Either<Exception, List<Host>>> call(Map<String, dynamic> body) async {
    return await repository.searchListHosts(body['limit'], body['offset'],
        body['start'], body['end'], body['adults'], body['address']);
  }
}
