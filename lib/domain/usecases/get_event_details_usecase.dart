import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/event_details_dto.dart';
import 'package:idwey/domain/repositories/repositories.dart';

import 'usecase.dart';

/// get event details usecase

class GetEventDetailsUseCase extends UseCase<EventDetailsDto, int> {
  final EventRepository _eventRepository;

  GetEventDetailsUseCase(this._eventRepository);

  @override
  Future<Either<Exception, EventDetailsDto>> call(int params) async {
    return await _eventRepository.getEvent(params);
  }
}
