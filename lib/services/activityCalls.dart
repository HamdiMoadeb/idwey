import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idwey/models/activity.dart';
import 'package:idwey/utils/urls.dart';

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
  static Future<Map> getActivityList(dynamic searchInputs, int skip) async {
    List<Activity> listActivities = [];
    String start = searchInputs['start'];
    String end = searchInputs['end'];
    String address = searchInputs['address'];
    String adults = searchInputs['adults'];
    var url = Uri.parse(
        '${Urls.URL_API}activity?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip');
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
      result["total"] = data["total"];
      result["list"] = listActivities;
    }

    return result;
  }

  //api for our hosts page
  static Future<ActivityDetail> getActivityDetails(int id) async {
    ActivityDetail activityDetail = new ActivityDetail(
        0, '', '','', '', 0, 0, '', '', '', '', '', '', [], [], 0, 0, []);
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
