import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/reviews_board_dto.dart';
import 'package:idwey/domain/repositories/review_repository.dart';

import 'usecase.dart';

class GetDashboardReviews
    extends UseCase<ReviewsBoardDto, Map<String, dynamic>> {
  final ReviewRepository repository;

  GetDashboardReviews(this.repository);

  @override
  Future<Either<Exception, ReviewsBoardDto>> call(
      Map<String, dynamic> params) async {
    return await repository.getDashboardReviews(
        params['serviceId'], params['type']);
  }
}
