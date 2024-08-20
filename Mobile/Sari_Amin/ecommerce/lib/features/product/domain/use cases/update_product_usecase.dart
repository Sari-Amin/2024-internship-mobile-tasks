import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class UpdateProductUsecase {
  final ProductRepository productRepository;
  UpdateProductUsecase(this.productRepository);

  Future<Either<Failure, bool>> execute(
      String id, ProductEntity productEntity) async {
    return await productRepository.updateProduct(id, productEntity);
  }
}
