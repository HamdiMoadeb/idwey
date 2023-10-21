import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/host_dto.dart';
import 'package:idwey/data/models/models.dart';
import 'package:idwey/domain/repositories/repositories.dart';

import 'usecase.dart';

class SearchListEventsUseCase
    implements UseCase<List<Event>?, Map<String, dynamic>> {
  final EventRepository repository;

  SearchListEventsUseCase(this.repository);

  @override
  Future<Either<Exception, List<Event>>> call(Map<String, dynamic> body) async {
    return await repository.searchListEvents(body['limit'], body['offset'],
        body['start'], body['end'], body['adults'], body['address']);
  }
}
