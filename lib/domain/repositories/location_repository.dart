import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/locations_dto.dart';

abstract class LocationRepository {
  Future<Either<Exception, List<LocationsDto>>> getLocations();
}
