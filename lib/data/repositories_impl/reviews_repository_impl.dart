import 'package:dartz/dartz.dart';
import 'package:idwey/data/data_sources/reviews_api_data_source.dart';
import 'package:idwey/data/models/reviews_board_dto.dart';
import 'package:idwey/domain/repositories/review_repository.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  ReviewsApiDataSource dataSource;
  ReviewRepositoryImpl(this.dataSource);

  @override
  Future<Either<Exception, dynamic>> getRateSettings(String serviceId) async {
    // try {
    final result = await dataSource.getRateSettings(serviceId);
    print("result");
    print(result);
    return Right(result);
    // } on Exception catch (e) {
    //   return Left(e);
    // }
  }

  @override
  Future<Either<Exception, String>> addReview(
      Map<String, dynamic> params) async {
    try {
      final result = await dataSource.addReview(params);
      print("result");
      print(result);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, ReviewsBoardDto>> getDashboardReviews(
      String serviceID, String type) async {
    try {
      final result = await dataSource.getDashboardReviews(serviceID, type);
      print("result");
      print(result);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, String>> updateReview(
      Map<String, dynamic> body) async {
    try {
      final result = await dataSource.updateReview(body);
      print("result");
      print(result);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
