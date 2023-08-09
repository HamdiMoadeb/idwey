import 'package:dio/dio.dart';
import 'package:idwey/data/models/host_dto.dart';

abstract class HostApiDataSource {
  Future<List<Host>> getListHosts(int limit, int offset);
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
}
