import 'package:dartz/dartz.dart';
import 'package:idwey/domain/repositories/host_repository.dart';
import 'package:idwey/domain/repositories/repositories.dart';
import 'package:idwey/domain/usecases/usecase.dart';

class DoOnlineCheckoutUseCase
    extends UseCase<Map<String, dynamic>, Map<String, dynamic>> {
  ReservationRepository repository;
  DoOnlineCheckoutUseCase(this.repository);

  @override
  Future<Either<Exception, Map<String, dynamic>>> call(
      Map<String, dynamic> params) async {
    print("params");
    print(params);
    return await repository.doOnlineCheckout(params);
  }
}
