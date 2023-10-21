import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/activity_details_dto.dart';
import 'package:idwey/data/models/models.dart';

abstract class ActivityRepository {
  Future<Either<Exception, List<Activity>>> getListActivities(
      int limit, int offset);
  Future<Either<Exception, ActivityDetailsDto>> getActivity(int id);
  Future<Either<Exception, List<Activity>>> searchListActivities(int limit,
      int offset, String start, String end, int adults, String address);
}
