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

  static Future<Map> getExperienceList(dynamic searchInputs, int skip) async {
    List<Experience> listExperiences = [];
    String start = searchInputs['start'];
    String end = searchInputs['end'];
    String address = searchInputs['address'];
    String adults = searchInputs['adults'];
    var url = Uri.parse(
        '${Urls.URL_API}experience?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip');
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
        listExperiences.add(Experience.fromJson(i));
      }
      result["total"] = data["total"];
      result["list"] = listExperiences;
    }

    return result;
  }

  static Future<ExperienceDetails> getExperienceDetails(int? id) async {
    ExperienceDetails experienceDetail = new ExperienceDetails(0, '', '', '', '', '', '', 0, '', 0, '', '', '', [], 0, 0, []);
    var url = Uri.parse('${Urls.URL_API}experience/detail/$id');
    print(url);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      experienceDetail = ExperienceDetails.fromJson(data);
    }
    print(experienceDetail.content);

    return experienceDetail;
  }
}
