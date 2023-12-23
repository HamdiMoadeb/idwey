import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/event_details_dto.dart';
import 'package:idwey/data/models/event_page_dto.dart';
import 'package:idwey/data/models/models.dart';

abstract class EventRepository {
  Future<Either<Exception, List<Event>>> getListEvents(int limit, int offset);
  Future<Either<Exception, EventDetailsDto>> getEvent(int id);
  Future<Either<Exception, List<Event>>> searchListEvents(int limit, int offset,
      String start, String end, int adults, String address);
  Future<Either<Exception, EventPageDto>> getEventPage(int limit, int offset);
}
