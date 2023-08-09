import 'package:dio/dio.dart';

import '../models/models.dart';

abstract class EventApiDataSource {
  Future<List<Event>> getListEvents(int limit, int offset);
}

class EventApiDataSourceImpl implements EventApiDataSource {
  final Dio dio;

  EventApiDataSourceImpl(this.dio);

  @override
  Future<List<Event>> getListEvents(int limit, int offset) async {
    List<Event> listOfHosts = [];
    try {
      final response =
          await dio.get("https://idwey.tn/api/event?offset=$offset&limit=10");
      response.data['rows'].forEach((data) {
        listOfHosts.add(Event.fromJson(data));
      });

      return listOfHosts;
    } catch (e) {
      throw Exception();
    }
  }
}
