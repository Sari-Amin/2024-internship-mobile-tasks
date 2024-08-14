part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class LoadAllProductEvent extends ProductEvent {}

final class GetSingleProductEvent extends ProductEvent {
  final String id;
  const GetSingleProductEvent(this.id);
}

final class UpdateProductEvent extends ProductEvent {
  final String id;
  final ProductEntity productEntity;
  const UpdateProductEvent(this.id, this.productEntity);
}

final class DeleteProductEvent extends ProductEvent {
  final String id;
  const DeleteProductEvent(this.id);
}

final class CreateProductEvent extends ProductEvent {
  final ProductEntity productEntity;
  const CreateProductEvent(this.productEntity);
}
