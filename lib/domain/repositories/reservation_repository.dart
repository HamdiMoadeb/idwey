import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/models.dart';

abstract class ReservationRepository {
  Future<Either<Exception, Map<String, dynamic>>> doCheckout(
      Map<String, dynamic> body);
}
