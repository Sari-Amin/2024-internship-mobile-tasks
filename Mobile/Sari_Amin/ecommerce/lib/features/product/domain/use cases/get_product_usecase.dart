import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetProductUsecase {
  final ProductRepository productRepository;
  GetProductUsecase(this.productRepository);

  Future<Either<Failure, ProductEntity>> execute(String id) async {
    return await productRepository.getProduct(id);
  }
}
