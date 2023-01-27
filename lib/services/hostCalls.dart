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
  static Future<List<Host>> getHostsList() async {
    List<Host> listHosts = [];

    var url = Uri.parse('${Urls.URL_API}hotel');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        listHosts.add(Host.fromJson(i));
      }
    }

    return listHosts;
  }

  //api for our hosts page
  static Future<List<Host>> getSearchedHostsList(dynamic searchFields) async {
    List<Host> listHosts = [];
    String start = searchFields['start'],
        end = searchFields['end'],
        address = searchFields['address'],
        adults = searchFields['adults'].toString();
    print('this is====> ' + address + end + start);
    var url = Uri.parse(
        '${Urls.URL_API}hotel?start=$start&end=$end&address=$address&adults=$adults');
    var response = await http.get(url);

    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        listHosts.add(Host.fromJson(i));
      }
    }

    return listHosts;
  }
}
