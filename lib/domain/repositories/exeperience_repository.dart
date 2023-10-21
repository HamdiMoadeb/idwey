import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/experience_details_dto.dart';
import 'package:idwey/data/models/models.dart';

abstract class ExperienceRepository {
  Future<Either<Exception, List<Experience>>> getListExperiences(
      int limit, int offset);
  Future<Either<Exception, ExperienceDetailsDto>> getExperience(int id);
  Future<Either<Exception, List<Experience>>> searchListExperiences(int limit,
      int offset, String start, String end, int adults, String address);
}
