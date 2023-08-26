import 'package:dio/dio.dart';
import 'package:idwey/data/models/host_details_dto.dart';
import 'package:idwey/data/models/host_dto.dart';

abstract class HostApiDataSource {
  Future<List<Host>> getListHosts(int limit, int offset);
  Future<HostDetails> getHost(int id);
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
}
