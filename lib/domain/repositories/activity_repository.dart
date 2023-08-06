import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/models.dart';

abstract class ActivityRepository {
  Future<Either<Exception, List<Activity>>> getListActivities(
      int limit, int offset);
}
