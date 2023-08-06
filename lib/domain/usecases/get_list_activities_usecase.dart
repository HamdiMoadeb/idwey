import 'package:dartz/dartz.dart';
import 'package:idwey/domain/repositories/activity_repository.dart';
import '../../data/models/models.dart';
import '../repositories/event_repository.dart';
import 'usecase.dart';

class GetListActivitiesUseCase
    implements UseCase<List<Activity>?, Map<String, dynamic>> {
  final ActivityRepository repository;

  GetListActivitiesUseCase(this.repository);

  @override
  Future<Either<Exception, List<Activity>>> call(
      Map<String, dynamic> body) async {
    return await repository.getListActivities(body['limit'], body['offset']);
  }
}
