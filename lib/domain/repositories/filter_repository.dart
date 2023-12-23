import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/models.dart';

abstract class FilterRepository {
  Future<Either<Exception, List<Host>>> filterHosts(Map<String, dynamic> body);
  Future<Either<Exception, List<Event>>> filterEvents(
      Map<String, dynamic> body);
  Future<Either<Exception, List<Activity>>> filterActivities(
      Map<String, dynamic> body);
  Future<Either<Exception, List<Experience>>> filterExperiences(
      Map<String, dynamic> body);
}
