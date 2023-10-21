import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/models.dart';

abstract class HostRepository {
  Future<Either<Exception, List<Host>>> getListHosts(int limit, int offset);
  Future<Either<Exception, HostDetails>> getHost(int id);
  Future<Either<Exception, dynamic>> checkHostAvailability(String type, int id,
      String checkIn, String checkOut, int adults, int children);
  Future<Either<Exception, Map<String, dynamic>>> confirmHostReservation(
      Map<String, dynamic> body);
  Future<Either<Exception, List<Host>>> searchListHosts(int limit, int offset,
      String start, String end, int adults, String address);
}
