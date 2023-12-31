import 'package:dartz/dartz.dart';
import 'package:idwey/data/data_sources/filter_api_data_source.dart';
import 'package:idwey/data/models/activity_dto.dart';
import 'package:idwey/data/models/event_dto.dart';
import 'package:idwey/data/models/experience_dto.dart';
import 'package:idwey/data/models/host_dto.dart';

import '../../domain/repositories/filter_repository.dart';

class FilterRepositoryImpl implements FilterRepository {
  FilterApiDataSource dataSource;
  FilterRepositoryImpl(this.dataSource);

  @override
  Future<Either<Exception, List<Host>>> filterHosts(
      Map<String, dynamic> body) async {
    // try {
    final result = await dataSource.filterHosts(body);
    return Right(result);
    // } on Exception catch (e) {
    //   return Left(e);
    // }
  }

  @override
  Future<Either<Exception, List<Activity>>> filterActivities(
      Map<String, dynamic> body) async {
    try {
      final result = await dataSource.filterActivities(body);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<Event>>> filterEvents(
      Map<String, dynamic> body) async {
    try {
      final result = await dataSource.filterEvents(body);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<Experience>>> filterExperiences(
      Map<String, dynamic> body) async {
    try {
      final result = await dataSource.filterRestaurants(body);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
