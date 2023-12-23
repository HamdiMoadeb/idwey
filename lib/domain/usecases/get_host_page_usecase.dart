import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/host_page_dto.dart';
import 'package:idwey/domain/repositories/repositories.dart';

import 'usecase.dart';

class GetHostPageUseCase implements UseCase<HostPageDto, Map<String, dynamic>> {
  final HostRepository repository;

  GetHostPageUseCase(this.repository);

  @override
  Future<Either<Exception, HostPageDto>> call(Map<String, dynamic> body) async {
    return await repository.getHostPageData(body['limit'], body['offset']);
  }
}
