import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idwey/utils/urls.dart';

import '../models/experience.dart';

class ExperienceCalls {
  static Future<List<Experience>> getAllExperiences() async {
    List<Experience> listExperience = [];

    var url = Uri.parse('${Urls.URL_API}experience/listExperience');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        listExperience.add(Experience.fromJson(i));
      }
    }
    return listExperience;
  }
}
