import 'package:dartz/dartz.dart';
import 'package:idwey/data/data_sources/data_sources.dart';
import 'package:idwey/data/models/models.dart';
import 'package:idwey/data/models/product_details_dto.dart';
import 'package:idwey/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductApiDataSource dataSource;
  ProductRepositoryImpl(this.dataSource);
  @override
  Future<Either<Exception, List<ProductDto>>> getListProducts(
      int limit, int offset) async {
    try {
      final result = await dataSource.getListProducts(limit, offset);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, ProductDetailsDto>> getProduct(int id) async {
    try {
      final result = await dataSource.getProduct(id);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<ProductDto>>> searchListProducts(int limit,
      int offset, String start, String end, int adults, String address) async {
    try {
      final result = await dataSource.searchListProducts(
          limit, offset, start, end, adults, address);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
