part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class InitialState extends ProductState {}

final class LoadingState extends ProductState {}

final class LoadedAllProductState extends ProductState {

  final List<ProductEntity> result;

  const LoadedAllProductState(this.result);

}

final class LoadedSingleProductState extends ProductState {
  final ProductEntity result;

  const LoadedSingleProductState(this.result);

}

final class ErrorState extends ProductState {
  final String result;

  const ErrorState(this.result);
}
