import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/event_page_dto.dart';
import 'package:idwey/domain/repositories/repositories.dart';

import 'usecase.dart';

class GetEventPageUseCase
    implements UseCase<EventPageDto, Map<String, dynamic>> {
  final EventRepository repository;

  GetEventPageUseCase(this.repository);

  @override
  Future<Either<Exception, EventPageDto>> call(
      Map<String, dynamic> body) async {
    return await repository.getEventPage(body['limit'], body['offset']);
  }
}
