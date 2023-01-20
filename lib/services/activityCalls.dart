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
        print(i);
        listActivity.add(Activity.fromJson(i));
      }
    }
    return listActivity;
  }
}
