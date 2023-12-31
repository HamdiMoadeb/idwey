import 'package:dartz/dartz.dart';
import 'package:idwey/data/data_sources/fidelity_program_api_data_source.dart';
import 'package:idwey/domain/repositories/fidleity_program_repository.dart';

class FidelityProgramRepositoryImpl implements FidelityProgramRepository {
  FidelityProgramApiDataSource dataSource;
  FidelityProgramRepositoryImpl(this.dataSource);
  @override
  Future<Either<Exception, Map<String, dynamic>>> getMonthlyPoints(
      String userId) async {
    try {
      final result = await dataSource.getMonthlyPoint(userId);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> getTotalPoints(
      String userId) async {
    try {
      final result = await dataSource.getTotalPoint(userId);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
