import 'package:dio/dio.dart';
import 'package:idwey/models/host.dart';

class HostRepository {
  final Dio _dio;
  HostRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Host> getHost(String id) async {
    final response = await _dio.get("");
    return Host.fromJson(response.data);
  }

  Future<List<Host>> getHosts() async {
    final response = await _dio.get("");
    return List<Host>.from(response.data.map((x) => Host.fromJson(x)));
  }

  // Future<Host> createHost(Host host) async {
  //   return await hostApiClient.createHost(host);
  // }
  //
  // Future<Host> updateHost(Host host) async {
  //   return await hostApiClient.updateHost(host);
  // }
  //
  // Future<Host> deleteHost(String id) async {
  //   return await hostApiClient.deleteHost(id);
  // }
}
