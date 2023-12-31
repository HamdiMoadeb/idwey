import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/experience_dto.dart';
import 'package:idwey/domain/repositories/filter_repository.dart';

import 'usecase.dart';

class FilterListExperiencesUseCase
    implements UseCase<List<Experience>?, Map<String, dynamic>> {
  final FilterRepository repository;

  FilterListExperiencesUseCase(this.repository);

  @override
  Future<Either<Exception, List<Experience>>> call(
      Map<String, dynamic> body) async {
    return await repository.filterExperiences(body);
  }
}
