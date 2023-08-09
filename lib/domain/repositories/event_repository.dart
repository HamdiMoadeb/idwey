import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/models.dart';

abstract class EventRepository {
  Future<Either<Exception, List<Event>>> getListEvents(int limit, int offset);
}
