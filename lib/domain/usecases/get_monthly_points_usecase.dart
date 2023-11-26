import 'package:dartz/dartz.dart';
import 'package:idwey/domain/repositories/fidleity_program_repository.dart';

import 'usecase.dart';

class GetMonthlyPointsUseCase extends UseCase<Map<String, dynamic>, String> {
  final FidelityProgramRepository fidelityProgramRepository;

  GetMonthlyPointsUseCase(this.fidelityProgramRepository);

  @override
  Future<Either<Exception, Map<String, dynamic>>> call(String params) async {
    return await fidelityProgramRepository.getMonthlyPoints(params);
  }
}
