import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class InsertProductUsecase {
  final ProductRepository productRepository;
  InsertProductUsecase(this.productRepository);

  Future<Either<Failure, bool>> execute(ProductEntity productEntity) async {
    return await productRepository.insertProduct(productEntity);
  }
}
