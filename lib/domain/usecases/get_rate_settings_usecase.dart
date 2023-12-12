import 'package:dartz/dartz.dart';
import 'package:idwey/domain/repositories/review_repository.dart';

import 'usecase.dart';

/// get event details usecase

class GetRateSettingsUseCase extends UseCase<dynamic, String> {
  final ReviewRepository reviewRepository;

  GetRateSettingsUseCase(this.reviewRepository);

  @override
  Future<Either<Exception, dynamic>> call(String params) async {
    return await reviewRepository.getRateSettings(params);
  }
}
