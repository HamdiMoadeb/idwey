import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idwey/utils/urls.dart';

import '../models/experience.dart';
import '../models/sharedModel.dart';

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

  static Future<Map> getExperienceList(
      dynamic searchInputs, int skip, dynamic filterInputs) async {
    List<Experience> listExperiences = [];
    String start = searchInputs['start'];
    String end = searchInputs['end'];
    String address = searchInputs['address'];
    String adults = searchInputs['adults'];
    List<String> priceRange = [];
    String max = filterInputs['max'];
    String min = filterInputs['min'];
    List<dynamic> termsList = filterInputs['terms'];
    List<dynamic> catIDList = filterInputs['catID'];

    List<Terms> activity_category = [];
    List<Terms> listConvenience = [];
    String terms = "";
    String catID = "";

    var url;
    if (termsList.length > 0) {
      for (var i = 0; i < termsList.length; i++) {
        if (i < termsList.length - 1) terms += termsList[i].toString() + ',';
        if (i == termsList.length - 1) terms += termsList[i].toString();
      }
    }

    if (catIDList.length > 0) {
      for (var i = 0; i < catIDList.length; i++) {
        if (i < catIDList.length - 1) catID += catIDList[i].toString() + ',';
        if (i == catIDList.length - 1) catID += catIDList[i].toString();
      }
    }

    if (max != '' && min != '' && termsList.isNotEmpty || catID.isNotEmpty) {
      url = Uri.parse(
          '${Urls.URL_API}experience?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip&price_range=$min%3B$max&cat_id=$catID&terms=$terms');
    } else if (catID.isEmpty && termsList.isEmpty && max != '' && min != '') {
      url = Uri.parse(
          '${Urls.URL_API}experience?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip&price_range=$min%3B$max');
    } else if (catID.isNotEmpty ||
        termsList.isNotEmpty && max == '' && min == '') {
      url = Uri.parse(
          '${Urls.URL_API}experience?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip&terms=$terms&cat_id=$catID');
    } else {
      url = Uri.parse(
          '${Urls.URL_API}experience?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip');
    }
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
      for (Map<String?, dynamic> i in data["activity_category"]) {
        activity_category.add(Terms.fromJson(i));
      }
      for (Map<String?, dynamic> i in data["attributes"][0]["terms"]) {
        listConvenience.add(Terms.fromJson(i));
      }
      priceRange = new List<String>.from(data["activity_min_max_price"]);
      result["listConvenience"] = listConvenience;
      result["activity_category"] = activity_category;
      result["total"] = data["total"];
      result["list"] = listExperiences;
      result["priceRange"] = priceRange;
      result["cities"] =
          List<String>.from(data["cities"].map((city) => city.toString()));
    }

    return result;
  }

  static Future<ExperienceDetails> getExperienceDetails(int? id) async {
    ExperienceDetails experienceDetail = new ExperienceDetails(
        0, '', '', '', '', '', '', 0, '', 0, '', '', '', [], 0, 0, []);
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
