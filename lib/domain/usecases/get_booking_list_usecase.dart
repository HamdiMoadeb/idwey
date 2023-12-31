import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/booking_dto.dart';
import 'package:idwey/domain/repositories/repositories.dart';
import 'package:idwey/domain/usecases/usecase.dart';

class GetBookingListUseCase
    extends UseCase<List<BookingDto>, Map<String, dynamic>> {
  ReservationRepository repository;
  GetBookingListUseCase(this.repository);

  @override
  Future<Either<Exception, List<BookingDto>>> call(
      Map<String, dynamic> params) async {
    return await repository.getReservationList(params['id']);
  }
}
