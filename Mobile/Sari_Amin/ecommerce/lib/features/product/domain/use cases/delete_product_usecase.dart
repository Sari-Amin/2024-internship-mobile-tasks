import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/product_repository.dart';

class DeleteProductUsecase {
  final ProductRepository productRepository;
  DeleteProductUsecase(this.productRepository);

  Future<Either<Failure, bool>> execute(String id) async {
    return await productRepository.deleteProduct(id);
  }
}
