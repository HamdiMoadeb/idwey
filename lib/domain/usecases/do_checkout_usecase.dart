import 'package:dartz/dartz.dart';
import 'package:idwey/domain/repositories/repositories.dart';
import 'package:idwey/domain/usecases/usecase.dart';

class DoCheckoutUseCase
    extends UseCase<Map<String, dynamic>, Map<String, dynamic>> {
  ReservationRepository repository;
  DoCheckoutUseCase(this.repository);

  @override
  Future<Either<Exception, Map<String, dynamic>>> call(
      Map<String, dynamic> params) async {
    return await repository.doCheckout(params);
  }
}
