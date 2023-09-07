/// get activity details usecase

import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/activity_details_dto.dart';
import 'package:idwey/domain/repositories/repositories.dart';

import 'usecase.dart';

class GetActivityDetailsUseCase extends UseCase<ActivityDetailsDto, int> {
  ActivityRepository repository;
  GetActivityDetailsUseCase(this.repository);

  @override
  Future<Either<Exception, ActivityDetailsDto>> call(int params) async {
    return await repository.getActivity(params);
  }
}
