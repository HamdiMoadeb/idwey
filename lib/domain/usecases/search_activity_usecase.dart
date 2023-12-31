import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/models.dart';
import 'package:idwey/domain/repositories/repositories.dart';

import 'usecase.dart';

class SearchListActivityUseCase
    implements UseCase<List<Activity>?, Map<String, dynamic>> {
  final ActivityRepository repository;

  SearchListActivityUseCase(this.repository);

  @override
  Future<Either<Exception, List<Activity>>> call(
      Map<String, dynamic> body) async {
    return await repository.searchListActivities(body['limit'], body['offset'],
        body['start'], body['end'], body['adults'], body['address']);
  }
}
