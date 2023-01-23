import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idwey/models/idweyForces.dart';
import 'package:idwey/utils/urls.dart';

import '../models/desire.dart';

class HomePageCalls {
  static Future<IdweyForces?> getIdweySectionData() async {
    IdweyForces? forces;

    var url = Uri.parse('${Urls.URL_API}idweySection');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      forces = IdweyForces.fromJson(data);
    }
    return forces;
  }

  static Future<List<Desire>> getAllDesires() async {
    List<Desire> listDesires = [];

    var url = Uri.parse('${Urls.URL_API}style/listStyle');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        print(i);
        listDesires.add(Desire.fromJson(i));
      }
    }
    return listDesires;
  }
}
