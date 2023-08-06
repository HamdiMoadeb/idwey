import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:idwey/data/data_sources/activity_api_data_source.dart';
import 'package:idwey/data/models/ActivityDTO.dart';
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
}
