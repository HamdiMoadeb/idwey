import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/host_dto.dart';
import 'package:idwey/data/models/models.dart';
import 'package:idwey/domain/repositories/repositories.dart';

import 'usecase.dart';

class SearchListExperienceUseCase
    implements UseCase<List<Experience>?, Map<String, dynamic>> {
  final ExperienceRepository repository;

  SearchListExperienceUseCase(this.repository);

  @override
  Future<Either<Exception, List<Experience>>> call(
      Map<String, dynamic> body) async {
    return await repository.searchListExperiences(body['limit'], body['offset'],
        body['start'], body['end'], body['adults'], body['address']);
  }
}
