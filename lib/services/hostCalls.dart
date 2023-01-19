import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idwey/models.dart';
import 'package:idwey/utils/urls.dart';

class HostCalls {
  Future<List<Host>> getAllHosts() async {
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
}
