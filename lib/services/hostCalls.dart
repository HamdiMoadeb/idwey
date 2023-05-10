import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idwey/models/host.dart';
import 'package:idwey/utils/urls.dart';

import '../models/sharedModel.dart';

class HostCalls {
  static Future<List<Host>> getAllHosts() async {
    List<Host> listHosts = [];

    var url = Uri.parse('${Urls.URL_API}hotel/listHost');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        listHosts.add(Host.fromJson(i));
      }
    }
    return listHosts;
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

    print(url);
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
      print('*********************${result["eur"]}');
    }
    return result;
  }

  //api for our hosts page
  static Future<HostDetail> getHostDetails(int? id) async {
    HostDetail hostDetail = new HostDetail(
        0, '', '', '', '', [], 0, '', '', 0, '', '', '', [], '', '', 0, 0, []);
    var url = Uri.parse('${Urls.URL_API}hotel/detail/$id');
    print(url);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      hostDetail = HostDetail.fromJson(data);
    }
    print(hostDetail.content);

    return hostDetail;
  }
}
