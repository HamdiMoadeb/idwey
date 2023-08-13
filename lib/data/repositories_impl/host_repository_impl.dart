import 'package:dartz/dartz.dart';
import 'package:idwey/data/data_sources/host_api_data_source.dart';
import 'package:idwey/data/models/host_details_dto.dart';
import 'package:idwey/data/models/host_dto.dart';
import 'package:idwey/domain/repositories/host_repository.dart';

class HostRepositoryImpl implements HostRepository {
  HostApiDataSource dataSource;
  HostRepositoryImpl(this.dataSource);
  @override
  Future<Either<Exception, List<Host>>> getListHosts(
      int limit, int offset) async {
    try {
      final result = await dataSource.getListHosts(limit, offset);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, HostDetails>> getHost(int id) async {
    try {
      final result = await dataSource.getHost(id);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
