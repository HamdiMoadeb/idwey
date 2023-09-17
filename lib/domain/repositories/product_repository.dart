import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/models.dart';
import 'package:idwey/data/models/product_details_dto.dart';

abstract class ProductRepository {
  Future<Either<Exception, List<ProductDto>>> getListProducts(
      int limit, int offset);
  Future<Either<Exception, ProductDetailsDto>> getProduct(int id);
}
