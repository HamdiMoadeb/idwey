import 'package:dartz/dartz.dart';
import 'package:idwey/data/data_sources/location_api_data_source.dart';
import 'package:idwey/data/models/locations_dto.dart';
import 'package:idwey/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  LocationApiDataSource dataSource;
  LocationRepositoryImpl(this.dataSource);
  @override
  Future<Either<Exception, List<LocationsDto>>> getLocations() async {
    try {
      final result = await dataSource.getListLocations();
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
