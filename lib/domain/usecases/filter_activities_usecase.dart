import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/activity_dto.dart';
import 'package:idwey/domain/repositories/filter_repository.dart';

import 'usecase.dart';

class FilterListActivitiesUseCase
    implements UseCase<List<Activity>?, Map<String, dynamic>> {
  final FilterRepository repository;

  FilterListActivitiesUseCase(this.repository);

  @override
  Future<Either<Exception, List<Activity>>> call(
      Map<String, dynamic> body) async {
    return await repository.filterActivities(body);
  }
}
