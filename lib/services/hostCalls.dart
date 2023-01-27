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
        print(i);
        listHosts.add(Host.fromJson(i));
      }
    }
    return listHosts;
  }

  //api for our hosts page
  static Future<Map<String, dynamic>> getHostsList(int page) async {
    List<Host> listHosts = [];
    Map<String, dynamic> hostsData = {
      'last_page': 0,
      'total': 0,
      'hosts': listHosts
    };
    var url = Uri.parse('${Urls.URL_API}hotel?page=$page');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]["data"]) {
        // print(i);
        listHosts.add(Host.fromJson(i));
      }
      hostsData = {
        'last_page': data["rows"]["last_page"] as int,
        'total': data["rows"]["total"] as int,
        'hosts': listHosts
      };
    }

    return hostsData;
  }
}
