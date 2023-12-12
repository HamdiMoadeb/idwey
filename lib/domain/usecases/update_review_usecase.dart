import 'package:dartz/dartz.dart';
import 'package:idwey/domain/repositories/review_repository.dart';
import 'package:idwey/domain/usecases/usecase.dart';

class UpdateReviewUseCase extends UseCase<dynamic, Map<String, dynamic>> {
  ReviewRepository repository;
  UpdateReviewUseCase(this.repository);

  @override
  Future<Either<Exception, String>> call(Map<String, dynamic> params) async {
    print("params");
    print(params);
    return await repository.updateReview(params);
  }
}
