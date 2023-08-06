import 'package:dio/dio.dart';
import '../models/models.dart';

abstract class ExperienceApiDataSource {
  Future<List<Experience>> getListExperiences(int limit, int offset);
}

class ExperienceApiDataSourceImpl implements ExperienceApiDataSource {
  final Dio dio;

  ExperienceApiDataSourceImpl(this.dio);

  @override
  Future<List<Experience>> getListExperiences(int limit, int offset) async {
    print("offset");
    print(offset);
    print("https://idwey.tn/api/experience?offset=$offset&limit=10");
    List<Experience> listOfExperiences = [];
    try {
      final response = await dio
          .get("https://idwey.tn/api/experience?offset=$offset&limit=10");
      if (response != null) {
        print("result");
        print(response.data['rows']);
        print(response.statusCode);
        print(response.data);
        response.data['rows'].forEach((data) {
          listOfExperiences.add(Experience.fromJson(data));
        });
      }
      return listOfExperiences;
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
