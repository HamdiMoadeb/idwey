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

  static Future<List<Host>> getAllHotels() async {
    List<Host> listHosts = [];

    var url = Uri.parse('${Urls.URL_API}hotel');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]["data"]) {
        // print(i);
        listHosts.add(Host.fromJson(i));
      }
      if (data["rows"]["current_page"] < data["rows"]["last_page"]) {
        var total_page_num = data["rows"]["last_page"];
        for (var current_page = data["rows"]["current_page"] + 1;
            current_page <= total_page_num;
            current_page++) {
          var urlPage = Uri.parse('${Urls.URL_API}hotel?page=$current_page');
          var responsePage = await http.get(urlPage);
          print('Response status: ${responsePage.statusCode}');
          // print('Response body: ${responsePage.body}');

          if (response.statusCode == 200) {
            final data = jsonDecode(responsePage.body);

            for (Map<String?, dynamic> i in data["rows"]["data"]) {
              // print(i);
              listHosts.add(Host.fromJson(i));
            }
          }
        }
      }
    }

    return listHosts;
  }
}
