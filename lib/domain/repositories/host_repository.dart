import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/models.dart';

abstract class HostRepository {
  Future<Either<Exception, List<Host>>> getListHosts(int limit, int offset);
  Future<Either<Exception, HostDetails>> getHost(int id);
  Future<Either<Exception, dynamic>> checkHostAvailability(
      int id, String checkIn, String checkOut, int adults, int children);
  Future<Either<Exception, Map<String, dynamic>>> confirmHostReservation(
      Map<String, dynamic> body);
}
