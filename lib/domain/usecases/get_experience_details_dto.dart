/// get experience details usecase

import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/experience_details_dto.dart';
import 'package:idwey/domain/repositories/repositories.dart';

import 'usecase.dart';

class GetExperienceDetailsUseCase extends UseCase<ExperienceDetailsDto, int> {
  ExperienceRepository repository;
  GetExperienceDetailsUseCase(this.repository);

  @override
  Future<Either<Exception, ExperienceDetailsDto>> call(int params) async {
    return await repository.getExperience(params);
  }
}
