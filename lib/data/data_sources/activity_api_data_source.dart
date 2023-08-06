import 'package:dio/dio.dart';
import '../models/models.dart';

abstract class ActivityApiDataSource {
  Future<List<Activity>> getListActivities(int limit, int offset);
}

class ActivityApiDataSourceImpl implements ActivityApiDataSource {
  final Dio dio;

  ActivityApiDataSourceImpl(this.dio);

  @override
  Future<List<Activity>> getListActivities(int limit, int offset) async {
    List<Activity> listOfActivities = [];
    try {
      final response = await dio
          .get("https://idwey.tn/api/activity?offset=$offset&limit=10");
      if (response != null) {
        print("result");
        print(response.data['rows']);
        response.data['rows'].forEach((data) {
          listOfActivities.add(Activity.fromJson(data));
        });
      }
      return listOfActivities;
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
