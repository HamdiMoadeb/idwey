import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idwey/models/activity.dart';
import 'package:idwey/utils/urls.dart';

import '../models/sharedModel.dart';

class ActivityCalls {
  static Future<List<Activity>> getAllActivities() async {
    List<Activity> listActivity = [];

    var url = Uri.parse('${Urls.URL_API}activity/listActivity');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        listActivity.add(Activity.fromJson(i));
      }
    }
    return listActivity;
  }

  //api for our hosts page
  static Future<Map> getActivityList(
      dynamic searchInputs, int skip, dynamic filterInputs) async {
    List<Activity> listActivities = [];
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
    List<Terms> listStyles = [];

    String terms = "";
    String catID = "";

    var url;
    print(termsList.length);
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
          '${Urls.URL_API}activity?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip&price_range=$min%3B$max&terms=$terms&cat_id=$catID');
    } else if (catID.isEmpty && termsList.isEmpty && max != '' && min != '') {
      url = Uri.parse(
          '${Urls.URL_API}activity?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip&price_range=$min%3B$max');
    } else if (catID.isNotEmpty ||
        termsList.isNotEmpty && max == '' && min == '') {
      url = Uri.parse(
          '${Urls.URL_API}activity?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip&terms=$terms&cat_id=$catID');
    } else {
      url = Uri.parse(
          '${Urls.URL_API}activity?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip');
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
        listActivities.add(Activity.fromJson(i));
      }
      for (Map<String?, dynamic> i in data["activity_category"]) {
        activity_category.add(Terms.fromJson(i));
      }
      for (Map<String?, dynamic> i in data["attributes"][1]["terms"]) {
        listConvenience.add(Terms.fromJson(i));
      }
      for (Map<String?, dynamic> i in data["attributes"][0]["terms"]) {
        listStyles.add(Terms.fromJson(i));
      }
      priceRange = new List<String>.from(data["activity_min_max_price"]);

      result["total"] = data["total"];
      result["list"] = listActivities;
      result["listConvenience"] = listConvenience;
      result["listStyles"] = listStyles;
      result["activity_category"] = activity_category;
      result["priceRange"] = priceRange;
      result["searchInputs"] = searchInputs;
      result["cities"] =
          List<String>.from(data["cities"].map((city) => city.toString()));
    }

    return result;
  }

  //api for our hosts page
  static Future<ActivityDetail> getActivityDetails(int id) async {
    ActivityDetail activityDetail = new ActivityDetail(
        0, '', '', '', '', 0, 0, '', '', '', '', '', '', [], [], 0, 0, []);
    var url = Uri.parse('${Urls.URL_API}activity/detail/${id}');
    print(url);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');

    Map result = {
      'list': [],
      'total': 0,
    };

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      activityDetail = ActivityDetail.fromJson(data);
    }

    return activityDetail;
  }
}
