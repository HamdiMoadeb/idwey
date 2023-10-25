import 'package:dartz/dartz.dart';
import 'package:idwey/data/data_sources/reservation_data_source.dart';
import 'package:idwey/domain/repositories/repositories.dart';

import '../models/booking_dto.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  ReservationApiDataSource dataSource;
  ReservationRepositoryImpl(this.dataSource);

  @override
  Future<Either<Exception, Map<String, dynamic>>> doCheckout(
      Map<String, dynamic> body) async {
    // try {
    final result = await dataSource.doCheckout(body);
    print("result");
    print(result);
    return Right(result);
    // } on Exception catch (e) {
    //   return Left(e);
    // }
  }

  @override
  Future<Either<Exception, List<BookingDto>>> getReservationList(
      int params) async {
    try {
      final result = await dataSource.getReservationList(params);
      print("result");
      print(result);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
