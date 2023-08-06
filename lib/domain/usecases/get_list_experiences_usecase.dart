import 'package:dartz/dartz.dart';
import 'package:idwey/domain/repositories/activity_repository.dart';
import 'package:idwey/domain/repositories/exeperience_repository.dart';
import '../../data/models/models.dart';
import '../repositories/event_repository.dart';
import 'usecase.dart';

class GetListExperiencesUseCase
    implements UseCase<List<Experience>?, Map<String, dynamic>> {
  final ExperienceRepository repository;

  GetListExperiencesUseCase(this.repository);

  @override
  Future<Either<Exception, List<Experience>>> call(
      Map<String, dynamic> body) async {
    return await repository.getListExperiences(body['limit'], body['offset']);
  }
}
