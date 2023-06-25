import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idwey/models/host.dart';
import 'package:idwey/utils/urls.dart';

import '../models/sharedModel.dart';

class HostCalls {
  static Future<Map> getAllHosts() async {
    List<Host> listHosts = [];
    Map result = {
      'list': [],
    };
    var url = Uri.parse('${Urls.URL_API}hotel/listHost');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        listHosts.add(Host.fromJson(i));
      }
      result["list"] = listHosts;
      result["eur"] = data["eur"];
      result["usd"] = data["usd"];
    }

    return result;
  }

  //api for our hosts page
  static Future<Map> getHostsList(
      dynamic searchInputs, int skip, dynamic filterInputs) async {
    List<Host> listHosts = [];
    List<Terms> listConvenience = [];
    List<Terms> listHotelService = [];
    List<Terms> listPropertyType = [];
    List<String> priceRange = [];
    String start = searchInputs['start'];
    String end = searchInputs['end'];
    String address = searchInputs['address'];
    String adults = searchInputs['adults'];
    String max = filterInputs['max'];
    String min = filterInputs['min'];
    List<dynamic> termsList = filterInputs['terms'];
    String terms = "";
    var url;

    if (termsList.isNotEmpty) {
      for (var i = 0; i < termsList.length; i++) {
        if (i < termsList.length - 1) terms += termsList[i].toString() + ',';
        if (i == termsList.length - 1) terms += termsList[i].toString();
      }
    }

    if (max != '' && min != '' && termsList.isNotEmpty)
      url = Uri.parse(
          '${Urls.URL_API}hotel?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip&price_range=$min%3B$max&terms=$terms');
    else if (max != '' && min != '' && termsList.isEmpty)
      url = Uri.parse(
          '${Urls.URL_API}hotel?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip&price_range=$min%3B$max');
    else if (termsList.isNotEmpty && max == '' && min == '')
      url = Uri.parse(
          '${Urls.URL_API}hotel?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip&terms=$terms');
    else
      url = Uri.parse(
          '${Urls.URL_API}hotel?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip');

    var response = await http.get(url);

    Map result = {
      'list': [],
      'total': 0,
    };
    print(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        listHosts.add(Host.fromJson(i));
      }
      for (Map<String?, dynamic> i in data["attributes"][1]["terms"]) {
        listConvenience.add(Terms.fromJson(i));
      }
      for (Map<String?, dynamic> i in data["attributes"][0]["terms"]) {
        listPropertyType.add(Terms.fromJson(i));
      }
      for (Map<String?, dynamic> i in data["attributes"][2]["terms"]) {
        listHotelService.add(Terms.fromJson(i));
      }

      priceRange = new List<String>.from(data["hotel_min_max_price"]);
      result["total"] = data["total"];
      result["list"] = listHosts;
      result["listConvenience"] = listConvenience;
      result["listHotelService"] = listHotelService;
      result["listPropertyType"] = listPropertyType;
      result["priceRange"] = priceRange;
      result["searchInputs"] = searchInputs;
      result["cities"] =
          List<String>.from(data["cities"].map((city) => city.toString()));
      result["eur"] = data["eur"];
      result["usd"] = data["usd"];
    }
    return result;
  }

  //api for our hosts page
  static Future<Map> getHostDetails(int? id) async {
    HostDetail hostDetail = new HostDetail(0, '', '', '', '', [], 0, '', '', 0,
        '', '', '', [], '', '', 0, 0, [], '', []);
    var url = Uri.parse('${Urls.URL_API}hotel/detail/$id');
    Map result = {
      'list': [],
    };
    print(url);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      hostDetail = HostDetail.fromJson(data);
      result['hostDetail'] = hostDetail;
      result["eur"] = data["eur"];
      result["usd"] = data["usd"];
    }

    return result;
  }

  static Future getHostDisponibility(String? dateStart, String? dateEnd,
      String? adultes, String? children, String? id) async {
    var url = Uri.parse(
        '${Urls.URL_API}hotel/checkAvailability?start_date=$dateStart&end_date=$dateEnd&adults=$adultes&children=$children&hotel_id=$id');
    Map result = {};
    List resultList = [];
    print(url);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      if (data is Map) {
        result = data;
        return result;
      } else {
        resultList = data;
        return resultList;
      }
    }
  }

  static Future<Map> AddHostToCart(
    String dateStart,
    String dateEnd,
    String adultes,
    String children,
    String id,
    String promo_code,
    String service_type,
    List<String> extra_price,
    List rooms,
  ) async {
    var url = Uri.parse('${Urls.URL_API}booking/addToCart');
    Map result = {};
    print(url);
    print({
      "start_date": dateStart,
      "end_date": dateEnd,
      "adults": adultes,
      "children": children,
      "promo_code": "",
      "service_id": id,
      "service_type": service_type,
      "extra_price": [],
      "rooms": rooms,
    });

    var response = await http.post(url,
        body: jsonEncode({
          "start_date": dateStart,
          "end_date": dateEnd,
          "adults": adultes,
          "children": children,
          "promo_code": "",
          "service_id": id,
          "service_type": service_type,
          "extra_price": [],
          "rooms": rooms,
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
