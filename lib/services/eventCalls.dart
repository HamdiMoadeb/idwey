import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idwey/utils/urls.dart';

import '../models/event.dart';
import '../models/sharedModel.dart';

class EventCalls {
  static Future<Map> getAllEvents() async {
    List<Event> listEvents = [];
    Map result = {
      'list': [],
    };
    var url = Uri.parse('${Urls.URL_API}event/listEvent');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        listEvents.add(Event.fromJson(i));
      }
      result["list"] = listEvents;
      result["eur"] = data["eur"];
      result["usd"] = data["usd"];
    }

    return result;
  }

  //api for our hosts page
  static Future<Map> getEventsList(
      dynamic searchInputs, int skip, dynamic filterInputs) async {
    List<Event> listEvents = [];
    String start = searchInputs['start'];
    String end = searchInputs['end'];
    String address = searchInputs['address'];
    String location_id = searchInputs['location_id'] == 0
        ? ''
        : searchInputs['location_id'].toString();
    List<Terms> listConvenience = [];
    List<Terms> listTypes = [];
    List<Location> listLocations = [];
    List<String> priceRange = [];

    String max = filterInputs['max'];
    String min = filterInputs['min'];
    List<dynamic> termsList = filterInputs['terms'];
    String terms = "";
    var url;
    if (termsList.length > 0) {
      for (var i = 0; i < termsList.length; i++) {
        if (i < termsList.length - 1) terms += termsList[i].toString() + ',';
        if (i == termsList.length - 1) terms += termsList[i].toString();
      }
    }

    if (max != '' && min != '' && termsList.isNotEmpty)
      url = Uri.parse(
          '${Urls.URL_API}event?address=$address&location_id=$location_id&start=$start&end=$end&limit=20&offset=$skip&price_range=$min%3B$max&terms=$terms');
    else if (max != '' && min != '' && termsList.isEmpty)
      url = Uri.parse(
          '${Urls.URL_API}event?address=$address&location_id=$location_id&start=$start&end=$end&limit=20&offset=$skip&price_range=$min%3B$max');
    else if (termsList.isNotEmpty && max == '' && min == '')
      url = Uri.parse(
          '${Urls.URL_API}event?address=$address&location_id=$location_id&start=$start&end=$end&limit=20&offset=$skip&terms=$terms');
    else
      url = Uri.parse(
          '${Urls.URL_API}event?address=$address&location_id=$location_id&start=$start&end=$end&limit=20&offset=$skip');

    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    Map result = {
      'list': [],
      'total': 0,
    };

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        listEvents.add(Event.fromJson(i));
      }
      for (Map<String?, dynamic> i in data["attributes"][1]["terms"]) {
        listConvenience.add(Terms.fromJson(i));
      }
      for (Map<String?, dynamic> i in data["attributes"][0]["terms"]) {
        listTypes.add(Terms.fromJson(i));
      }

      for (Map<String?, dynamic> i in data["list_location"]) {
        listLocations.add(Location.fromJson(i));
      }
      Location placeHolderLocation = Location(0, 'Où vous allez?');
      listLocations.insert(0, placeHolderLocation);
      priceRange = new List<String>.from(data["event_min_max_price"]);

      result["total"] = data["total"];
      result["list"] = listEvents;
      result["listConvenience"] = listConvenience;
      result["listType"] = listTypes;
      result["priceRange"] = priceRange;
      result["list_location"] = listLocations;
      result["searchInputs"] = searchInputs;
      result["eur"] = data["eur"];
      result["usd"] = data["usd"];
      result["cities"] =
          List<String>.from(data["cities"].map((city) => city.toString()));
    }

    return result;
  }

  //api for  event details
  static Future<Map> getEventDetails(int id) async {
    EventDetails eventDetail = EventDetails(0, '', '', '', '', '', 0, '', '', 0,
        '', '', '', '', '', '', '', [], 0, 0, [], '', '', '', 0, 0);
    var url = Uri.parse('${Urls.URL_API}event/detail/${id}');
    Map result = {
      'list': [],
    };
    print(url);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      eventDetail = EventDetails.fromJson(data);
      result['eventDetail'] = eventDetail;

      result["eur"] = data["eur"];
      result["usd"] = data["usd"];
    }

    return result;
  }

  static Future<Map> AddEventToCart(
    String dateStart,
    String number,
    String id,
    String promo_code,
    String service_type,
    List<String> extra_price,
  ) async {
    var url = Uri.parse('${Urls.URL_API}booking/addToCart');
    Map result = {};
    print(url);
    print({
      "start_date": dateStart,
      "number": number,
      "promo_code": "",
      "service_id": id,
      "service_type": service_type,
      "extra_price": [],
    });

    var response = await http.post(url,
        body: jsonEncode({
          "start_date": dateStart,
          "number": number,
          "promo_code": "",
          "service_id": id,
          "service_type": service_type,
          "extra_price": [],
        }),
        headers: {
          "Content-Type": "application/json",
        });
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      result = data;
    }

    return result;
  }
}
