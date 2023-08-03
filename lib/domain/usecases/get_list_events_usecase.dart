import 'package:dartz/dartz.dart';
import '../../data/models/models.dart';
import '../repositories/event_repository.dart';
import 'usecase.dart';

class GetListEventsUseCase
    implements UseCase<List<Event>?, Map<String, dynamic>> {
  final EventRepository repository;

  GetListEventsUseCase(this.repository);

  @override
  Future<Either<Exception, List<Event>>> call(Map<String, dynamic> body) async {
    return await repository.getListEvents(body['limit'], body['offset']);
  }
}
