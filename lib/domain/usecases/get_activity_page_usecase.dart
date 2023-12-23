import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/activity_page_dto.dart';
import 'package:idwey/domain/repositories/repositories.dart';

import 'usecase.dart';

class GetActivityPageUseCase
    implements UseCase<ActivityPageDto, Map<String, dynamic>> {
  final ActivityRepository repository;

  GetActivityPageUseCase(this.repository);

  @override
  Future<Either<Exception, ActivityPageDto>> call(
      Map<String, dynamic> body) async {
    return await repository.getActivityDataPage(body['limit'], body['offset']);
  }
}
