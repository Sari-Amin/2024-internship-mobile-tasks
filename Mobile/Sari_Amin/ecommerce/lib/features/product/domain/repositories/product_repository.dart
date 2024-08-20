import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductEntity>> getProduct(String id);
  Future<Either<Failure, bool>> insertProduct(ProductEntity product);
  Future<Either<Failure, bool>> updateProduct(String id, ProductEntity product);
  Future<Either<Failure, bool>> deleteProduct(String id);
  Future<Either<Failure, List<ProductEntity>>> getAllProduct();
}
