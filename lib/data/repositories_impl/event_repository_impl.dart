import 'package:dartz/dartz.dart';
import 'package:idwey/data/data_sources/event_api_data_source.dart';
import 'package:idwey/data/models/event_details_dto.dart';
import 'package:idwey/data/models/event_dto.dart';
import 'package:idwey/domain/repositories/event_repository.dart';

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

  @override
  Future<Either<Exception, EventDetailsDto>> getEvent(int id) async {
    try {
      final result = await dataSource.getEvent(id);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
