import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/host_details_dto.dart';
import 'package:idwey/data/models/models.dart';

abstract class HostRepository {
  Future<Either<Exception, List<Host>>> getListHosts(int limit, int offset);
  Future<Either<Exception, HostDetails>> getHost(int id);
}
