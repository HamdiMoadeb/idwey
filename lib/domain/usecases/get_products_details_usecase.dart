import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/product_details_dto.dart';
import 'package:idwey/domain/repositories/product_repository.dart';

import 'usecase.dart';

/// get event details usecase

class GetProductDetailsUseCase extends UseCase<ProductDetailsDto, int> {
  final ProductRepository _productRepository;

  GetProductDetailsUseCase(this._productRepository);

  @override
  Future<Either<Exception, ProductDetailsDto>> call(int params) async {
    return await _productRepository.getProduct(params);
  }
}
