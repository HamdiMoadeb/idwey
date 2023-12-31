import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/booking_dto.dart';

abstract class ReservationRepository {
  Future<Either<Exception, Map<String, dynamic>>> doCheckout(
      Map<String, dynamic> body);
  Future<Either<Exception, Map<String, dynamic>>> doOnlineCheckout(
      Map<String, dynamic> body);
  Future<Either<Exception, List<BookingDto>>> getReservationList(int params);
}
