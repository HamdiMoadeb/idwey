import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:idwey/data/data_sources/event_api_data_source.dart';
import 'package:idwey/data/data_sources/host_api_data_source.dart';
import 'package:idwey/data/models/EventDTO.dart';
import 'package:idwey/data/models/hostDTO.dart';
import 'package:idwey/domain/repositories/event_repository.dart';
import 'package:idwey/domain/repositories/host_repository.dart';

class EventRepositoryImpl implements EventRepository {
  EventApiDataSource dataSource;
  EventRepositoryImpl(this.dataSource);
  @override
  Future<Either<Exception, List<Event>>> getListEvents(
      int limit, int offset) async {
    try {
      final result = await dataSource.getListEvents(limit, offset);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
