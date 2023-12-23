import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/host_dto.dart';
import 'package:idwey/domain/repositories/filter_repository.dart';

import 'usecase.dart';

class FilterListHostsUseCase
    implements UseCase<List<Host>?, Map<String, dynamic>> {
  final FilterRepository repository;

  FilterListHostsUseCase(this.repository);

  @override
  Future<Either<Exception, List<Host>>> call(Map<String, dynamic> body) async {
    return await repository.filterHosts(body);
  }
}
