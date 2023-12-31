import 'package:dartz/dartz.dart';
import 'package:idwey/data/data_sources/host_api_data_source.dart';
import 'package:idwey/data/models/host_details_dto.dart';
import 'package:idwey/data/models/host_dto.dart';
import 'package:idwey/data/models/host_page_dto.dart';
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

  @override
  Future<Either<Exception, dynamic>> checkHostAvailability(String type, int id,
      String checkIn, String checkOut, int adults, int children) async {
    try {
      final result = await dataSource.checkHostAvailability(
          type, id, checkIn, checkOut, adults, children);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> confirmHostReservation(
      Map<String, dynamic> body) async {
    // try {
    final result = await dataSource.confirmHostReservation(body);

    return Right(result);
    // } on Exception catch (e) {
    //   return Left(e);
    // }
  }

  @override
  Future<Either<Exception, List<Host>>> searchListHosts(int limit, int offset,
      String start, String end, int adults, String address) async {
    // try {
    final result = await dataSource.searchListHosts(
        limit, offset, start, end, adults, address);

    return Right(result);
    // } on Exception catch (e) {
    //   return Left(e);
    // }
  }

  @override
  Future<Either<Exception, HostPageDto>> getHostPageData(
      int limit, int offset) async {
    try {
      final result = await dataSource.getHostPageData(limit, offset);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
