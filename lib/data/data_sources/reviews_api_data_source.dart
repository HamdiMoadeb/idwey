import 'package:dio/dio.dart';
import 'package:idwey/data/models/booking_dto.dart';
import 'package:idwey/data/models/host_details_dto.dart';
import 'package:idwey/data/models/host_dto.dart';
import 'package:idwey/data/models/review_dto.dart';
import 'package:idwey/data/models/reviews_board_dto.dart';

abstract class ReviewsApiDataSource {
  Future<dynamic> getRateSettings(String serviceID);
  Future<String> addReview(Map<String, dynamic> body);
  Future<String> updateReview(Map<String, dynamic> body);
  Future<ReviewsBoardDto> getDashboardReviews(String serviceID, String type);
}

class ReviewsApiDataSourceImpl implements ReviewsApiDataSource {
  final Dio dio;

  ReviewsApiDataSourceImpl(this.dio);

  @override
  Future<String> addReview(Map<String, dynamic> body) async {
    try {
      final response =
          await dio.post("https://dev.idwey.tn/api/addreviewApi", data: body);

      print("response.data");
      print(response.data);

      return response.data;
    } catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Future<dynamic> getRateSettings(String serviceID) async {
    // try {
    print("https://idwey.tn/api/ratesetting/$serviceID");
    final response =
        await dio.get("https://idwey.tn/api/ratesetting/$serviceID");
    print("response.data");
    print(response.data);

    return response.data;
    // } catch (e) {
    //   print(e);
    //   throw Exception();
    // }
  }

  @override
  Future<ReviewsBoardDto> getDashboardReviews(
      String serviceID, String type) async {
    print("https://idwey.tn/api/reviews/$serviceID/$type");
    final response =
        await dio.get("https://idwey.tn/api/reviews/$serviceID/$type");

    print("response.data");
    print(response.data);
    return ReviewsBoardDto.fromJson(response.data);
  }

  @override
  Future<String> updateReview(Map<String, dynamic> body) async {
    print("updateReview");
    final response =
        await dio.put("https://dev.idwey.tn/api/updatereviewApi", data: body);
    print("response.data");
    print(response);
    return response.data;
  }
}
