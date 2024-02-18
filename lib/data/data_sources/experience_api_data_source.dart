import 'package:dio/dio.dart';
import 'package:idwey/data/models/experience_details_dto.dart';
import 'package:idwey/data/models/experience_page_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';

abstract class ExperienceApiDataSource {
  Future<List<Experience>> getListExperiences(int limit, int offset);
  Future<ExperiencePageDto> getExperiencePageData(int limit, int offset);
  Future<ExperienceDetailsDto> getExperience(int id);
  Future<List<Experience>> searchListExperiences(int limit, int offset,
      String start, String end, int adults, String address);
}

class ExperienceApiDataSourceImpl implements ExperienceApiDataSource {
  final Dio dio;

  ExperienceApiDataSourceImpl(this.dio);

  @override
  Future<List<Experience>> getListExperiences(int limit, int offset) async {
    List<Experience> listOfExperiences = [];
    try {
      final response = await dio
          .get("https://idwey.tn/api/experience?offset=$offset&limit=10");
      response.data['rows'].forEach((data) {
        listOfExperiences.add(Experience.fromJson(data));
      });

      return listOfExperiences;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<ExperienceDetailsDto> getExperience(int id) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      String userId = preferences.getString("userId") ?? "0";
      print("https://idwey.tn/api/experience/detail/$id/$userId");
      final response =
          await dio.get("https://idwey.tn/api/experience/detail/$id/0");
      return ExperienceDetailsDto.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Experience>> searchListExperiences(int limit, int offset,
      String start, String end, int adults, String address) async {
    List<Experience> listOfExperiences = [];
    print(
        "https://idwey.tn/api/experience?offset=$offset&limit=$limit&start=$start&end=$end&address=$address&adults=$adults");
    final response = await dio.get(
        "https://idwey.tn/api/experience?offset=$offset&limit=$limit&start=$start&end=$end&address=$address&adults=$adults");

    print("response.data");
    print(response.data);
    response.data['rows'].forEach((data) {
      listOfExperiences.add(Experience.fromJson(data));
    });
    print("listOfExperiences");
    print(listOfExperiences);
    return listOfExperiences;
  }

  @override
  Future<ExperiencePageDto> getExperiencePageData(int limit, int offset) async {
    try {
      final response = await await dio
          .get("https://idwey.tn/api/experience?offset=$offset&limit=10");
      return ExperiencePageDto.fromJson(response.data);
    } catch (e) {
      throw Exception();
    }
  }
}
