import 'package:dio/dio.dart';
import 'package:idwey/data/models/activity_details_dto.dart';
import 'package:idwey/data/models/activity_page_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';

abstract class ActivityApiDataSource {
  Future<List<Activity>> getListActivities(int limit, int offset);
  Future<ActivityPageDto> getActivityPageData(int limit, int offset);
  Future<ActivityDetailsDto> getActivity(int id);
  Future<List<Activity>> searchListActivities(int limit, int offset,
      String start, String end, int adults, String address);
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

      response.data['rows'].forEach((data) {
        listOfActivities.add(Activity.fromJson(data));
      });

      return listOfActivities;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<ActivityDetailsDto> getActivity(int id) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      String userId = preferences.getString("userId") ?? "0";

      final response =
          await dio.get("https://idwey.tn/api/activity/detail/$id/$userId");

      return ActivityDetailsDto.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Activity>> searchListActivities(int limit, int offset,
      String start, String end, int adults, String address) async {
    List<Activity> listOfActivities = [];

    final response = await dio.get(
        "https://idwey.tn/api/activity?offset=$offset&limit=$limit&start=$start&end=$end&address=$address&adults=$adults");

    response.data['rows'].forEach((data) {
      listOfActivities.add(Activity.fromJson(data));
    });

    return listOfActivities;
  }

  @override
  Future<ActivityPageDto> getActivityPageData(int limit, int offset) async {
    try {
      final response = await dio
          .get("https://idwey.tn/api/activity?offset=$offset&limit=10");

      return ActivityPageDto.fromJson(response.data);
    } catch (e) {
      throw Exception();
    }
  }
}
