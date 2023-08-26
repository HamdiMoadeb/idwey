import 'package:dio/dio.dart';
import 'package:idwey/data/models/experience_details_dto.dart';
import '../models/models.dart';

abstract class ExperienceApiDataSource {
  Future<List<Experience>> getListExperiences(int limit, int offset);
  Future<ExperienceDetailsDto> getExperience(int id);
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
      final response =
          await dio.get("https://idwey.tn/api/experience/detail/137");
      return ExperienceDetailsDto.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
