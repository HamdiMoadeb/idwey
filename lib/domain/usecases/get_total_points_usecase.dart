import 'package:dartz/dartz.dart';
import 'package:idwey/domain/repositories/fidleity_program_repository.dart';

import 'usecase.dart';

class GetTotalPointsUseCase extends UseCase<Map<String, dynamic>, String> {
  final FidelityProgramRepository fidelityProgramRepository;

  GetTotalPointsUseCase(this.fidelityProgramRepository);

  @override
  Future<Either<Exception, Map<String, dynamic>>> call(String params) async {
    return await fidelityProgramRepository.getTotalPoints(params);
  }
}
