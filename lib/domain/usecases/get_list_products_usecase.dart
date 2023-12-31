import 'package:dartz/dartz.dart';
import 'package:idwey/domain/repositories/product_repository.dart';
import '../../data/models/models.dart';
import 'usecase.dart';

class GetListProductsUseCase
    implements UseCase<List<ProductDto>?, Map<String, dynamic>> {
  final ProductRepository repository;

  GetListProductsUseCase(this.repository);

  @override
  Future<Either<Exception, List<ProductDto>>> call(
      Map<String, dynamic> body) async {
    return await repository.getListProducts(body['limit'], body['offset']);
  }
}
