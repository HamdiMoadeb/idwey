import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/models.dart';

abstract class ExperienceRepository {
  Future<Either<Exception, List<Experience>>> getListExperiences(
      int limit, int offset);
}
