import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetAllProductsUsecase {
  final ProductRepository productRepository;
  GetAllProductsUsecase(this.productRepository);

  Future<Either<Failure, List<ProductEntity>>> execute() async {
    return await productRepository.getAllProduct();
  }
}
