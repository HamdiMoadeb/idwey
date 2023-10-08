import 'package:dio/dio.dart';
import 'package:idwey/data/models/host_details_dto.dart';
import 'package:idwey/data/models/host_dto.dart';

abstract class HostApiDataSource {
  Future<List<Host>> getListHosts(int limit, int offset);
  Future<HostDetails> getHost(int id);
  Future<Map<String, dynamic>> checkHostAvailability(
      int id, String checkIn, String checkOut, int adults, int children);
}

class HostApiDataSourceImpl implements HostApiDataSource {
  final Dio dio;

  HostApiDataSourceImpl(this.dio);

  @override
  Future<List<Host>> getListHosts(int limit, int offset) async {
    List<Host> listOfHosts = [];
    try {
      final response =
          await dio.get("https://idwey.tn/api/hotel?offset=$offset&limit=10");
      response.data['rows'].forEach((data) {
        listOfHosts.add(Host.fromJson(data));
      });

      return listOfHosts;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<HostDetails> getHost(int id) async {
    try {
      final response = await dio.get("https://idwey.tn/api/hotel/detail/$id");

      return HostDetails.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Map<String, dynamic>> checkHostAvailability(
      int id, String checkIn, String checkOut, int adults, int children) async {
    try {
      print(
        "https://idwey.tn/api/hotel/checkAvailability?start_date=$checkIn&end_date=$checkOut&adults=$adults&children=$children&hotel_id=$id",
      );
      final response = await dio.get(
        "https://idwey.tn/api/hotel/checkAvailability?start_date=$checkIn&end_date=$checkOut&adults=$adults&children=$children&hotel_id=$id",
      );

      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }
}
