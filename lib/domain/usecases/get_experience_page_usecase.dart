import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/experience_page_dto.dart';
import 'package:idwey/domain/repositories/repositories.dart';

import 'usecase.dart';

class GetExperiencePageUseCase
    implements UseCase<ExperiencePageDto, Map<String, dynamic>> {
  final ExperienceRepository repository;

  GetExperiencePageUseCase(this.repository);

  @override
  Future<Either<Exception, ExperiencePageDto>> call(
      Map<String, dynamic> body) async {
    return await repository.getExperienceDataPage(
        body['limit'], body['offset']);
  }
}
