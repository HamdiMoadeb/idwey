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
        print(i);
        listEvents.add(Event.fromJson(i));
      }
    }
    return listEvents;
  }
}
