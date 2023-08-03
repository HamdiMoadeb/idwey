import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/models.dart';

abstract class HostRepository {
  Future<Either<Exception, List<Host>>> getListHosts(int limit, int offset);
}
