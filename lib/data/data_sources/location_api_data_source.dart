import 'package:dio/dio.dart';
import 'package:idwey/data/models/locations_dto.dart';

abstract class LocationApiDataSource {
  Future<List<LocationsDto>> getListLocations();
}

class LocationApiDataSourceImpl implements LocationApiDataSource {
  final Dio dio;

  LocationApiDataSourceImpl(this.dio);

  @override
  Future<List<LocationsDto>> getListLocations() async {
    List<LocationsDto> listOfHosts = [];
    try {
      final response =
          await dio.get("https://idwey.tn/api/location/listLocation");
      response.data['rows'].forEach((data) {
        listOfHosts.add(LocationsDto.fromJson(data));
      });
      return listOfHosts;
    } catch (e) {
      throw Exception();
    }
  }
}
