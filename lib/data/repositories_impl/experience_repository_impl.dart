import 'package:dartz/dartz.dart';
import 'package:idwey/data/data_sources/data_sources.dart';
import 'package:idwey/data/models/experience_dto.dart';
import 'package:idwey/domain/repositories/repositories.dart';

class ExperienceRepositoryImpl implements ExperienceRepository {
  ExperienceApiDataSource dataSource;
  ExperienceRepositoryImpl(this.dataSource);
  @override
  Future<Either<Exception, List<Experience>>> getListExperiences(
      int limit, int offset) async {
    try {
      final result = await dataSource.getListExperiences(limit, offset);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
