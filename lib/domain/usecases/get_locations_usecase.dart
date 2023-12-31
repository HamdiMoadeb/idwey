import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/locations_dto.dart';
import 'package:idwey/domain/repositories/location_repository.dart';
import 'usecase.dart';

class GetLocationsUseCase
    implements UseCase<List<LocationsDto>?, Map<String, dynamic>> {
  final LocationRepository repository;

  GetLocationsUseCase(this.repository);

  @override
  Future<Either<Exception, List<LocationsDto>>> call(
      Map<String, dynamic> body) async {
    return await repository.getLocations();
  }
}
