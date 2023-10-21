import 'package:dio/dio.dart';
import 'package:idwey/data/models/event_details_dto.dart';

import '../models/models.dart';

abstract class EventApiDataSource {
  Future<List<Event>> getListEvents(int limit, int offset);
  Future<EventDetailsDto> getEvent(int id);
  Future<List<Event>> searchListEvents(int limit, int offset, String start,
      String end, int adults, String address);
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

  @override
  Future<EventDetailsDto> getEvent(int id) async {
    print("id");
    print(id);
    try {
      final response = await dio.get("https://idwey.tn/api/event/detail/$id");
      print("result222222");
      print(response);
      return EventDetailsDto.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Event>> searchListEvents(int limit, int offset, String start,
      String end, int adults, String address) async {
    List<Event> listOfHosts = [];
    print(
        "https://idwey.tn/api/event?offset=$offset&limit=$limit&address$address=&start$start=&end=$end");
    final response = await dio.get(
        "https://idwey.tn/api/event?offset=$offset&limit=$limit&address=$address&start=$start&end=$end");
    print("response.data");
    print(response.data);
    response.data['rows'].forEach((data) {
      listOfHosts.add(Event.fromJson(data));
    });

    return listOfHosts;
  }
}
