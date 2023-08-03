import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:idwey/data/models/hostDTO.dart';

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
      if (response != null) {
        print("result");
        print(response.data['rows']);
        response.data['rows'].forEach((data) {
          listOfHosts.add(Event.fromJson(data));
        });
      }
      return listOfHosts;
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
