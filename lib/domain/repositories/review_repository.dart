import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/booking_dto.dart';
import 'package:idwey/data/models/models.dart';
import 'package:idwey/data/models/review_dto.dart';
import 'package:idwey/data/models/reviews_board_dto.dart';

abstract class ReviewRepository {
  Future<Either<Exception, dynamic>> getRateSettings(String serviceID);
  Future<Either<Exception, String>> addReview(Map<String, dynamic> body);
  Future<Either<Exception, String>> updateReview(Map<String, dynamic> body);
  Future<Either<Exception, ReviewsBoardDto>> getDashboardReviews(
      String serviceID, String type);
}
