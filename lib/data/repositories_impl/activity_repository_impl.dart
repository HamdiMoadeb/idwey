import 'package:dartz/dartz.dart';
import 'package:idwey/data/data_sources/activity_api_data_source.dart';
import 'package:idwey/data/models/activity_details_dto.dart';
import 'package:idwey/data/models/activity_dto.dart';
import 'package:idwey/domain/repositories/repositories.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  ActivityApiDataSource dataSource;
  ActivityRepositoryImpl(this.dataSource);
  @override
  Future<Either<Exception, List<Activity>>> getListActivities(
      int limit, int offset) async {
    try {
      final result = await dataSource.getListActivities(limit, offset);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, ActivityDetailsDto>> getActivity(int id) async {
    try {
      final result = await dataSource.getActivity(id);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<Activity>>> searchListActivities(int limit,
      int offset, String start, String end, int adults, String address) async {
    try {
      final result = await dataSource.searchListActivities(
          limit, offset, start, end, adults, address);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
