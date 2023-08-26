import 'package:dio/dio.dart';
import 'package:idwey/data/models/activity_details_dto.dart';
import '../models/models.dart';

abstract class ActivityApiDataSource {
  Future<List<Activity>> getListActivities(int limit, int offset);
  Future<ActivityDetailsDto> getActivity(int id);
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
      final response =
          await dio.get("https://idwey.tn/api/activity/detail/152");

      return ActivityDetailsDto.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
