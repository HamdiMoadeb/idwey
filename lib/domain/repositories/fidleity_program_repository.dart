import 'package:dartz/dartz.dart';

abstract class FidelityProgramRepository {
  Future<Either<Exception, Map<String, dynamic>>> getMonthlyPoints(
      String userId);
  Future<Either<Exception, Map<String, dynamic>>> getTotalPoints(String userId);
}
