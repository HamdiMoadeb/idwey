import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/event_dto.dart';
import 'package:idwey/domain/repositories/filter_repository.dart';

import 'usecase.dart';

class FilterListEventsUseCase
    implements UseCase<List<Event>?, Map<String, dynamic>> {
  final FilterRepository repository;

  FilterListEventsUseCase(this.repository);

  @override
  Future<Either<Exception, List<Event>>> call(Map<String, dynamic> body) async {
    return await repository.filterEvents(body);
  }
}
