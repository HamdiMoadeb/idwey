import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idwey/utils/urls.dart';

import '../models/event.dart';

class EventCalls {
  static Future<List<Event>> getAllEvents() async {
    List<Event> listEvents = [];

    var url = Uri.parse('${Urls.URL_API}event/listEvent');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        listEvents.add(Event.fromJson(i));
      }
    }
    return listEvents;
  }

  //api for our hosts page
  static Future<List<Event>> getEventsList(
      dynamic searchInputs, int skip) async {
    List<Event> listEvents = [];
    String start = searchInputs['start'];
    String end = searchInputs['end'];
    String address = searchInputs['address'];
    String location_id = searchInputs['location_id'] == 'Où vous allez?'
        ? ''
        : searchInputs['location_id'];
    var url = Uri.parse(
        '${Urls.URL_API}event?address=$address&location_id=$location_id&start=$start&end=$end&limit=20&offset=$skip');
    print(url);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        listEvents.add(Event.fromJson(i));
      }
    }

    return listEvents;
  }
}
