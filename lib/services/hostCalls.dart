import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idwey/models/host.dart';
import 'package:idwey/utils/urls.dart';

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
  static Future<Map> getHostsList(dynamic searchInputs, int skip) async {
    List<Host> listHosts = [];
    String start = searchInputs['start'];
    String end = searchInputs['end'];
    String address = searchInputs['address'];
    String adults = searchInputs['adults'];
    var url = Uri.parse(
        '${Urls.URL_API}hotel?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip');
    print(url);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    Map result = {
      'list': [],
      'total': 0,
    };

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        listHosts.add(Host.fromJson(i));
      }
      result["total"] = data["total"];
      result["list"] = listHosts;
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
