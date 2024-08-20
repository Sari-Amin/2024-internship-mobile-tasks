import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/product_repository_impl.dart';
import '../../domain/entities/product_entity.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepositoryImpl productRepositoryImpl;

  ProductBloc(this.productRepositoryImpl) : super(InitialState()) {
    on<LoadAllProductEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final result = await productRepositoryImpl.getAllProduct();
        result.fold(
          (failure) => emit(
            const ErrorState("Server Failure"),
          ),
          (data) => emit(LoadedAllProductState(data)),
        );
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });

    on<GetSingleProductEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final result = await productRepositoryImpl.getProduct(event.id);
        result.fold(
          (failure) => emit(
            const ErrorState("Server Failure!"),
          ),
          (data) => emit(
            LoadedSingleProductState(data),
          ),
        );
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });

    on<UpdateProductEvent>((event, emit) async {
      try {
        final result = await productRepositoryImpl.updateProduct(
            event.id, event.productEntity);
        result.fold(
            (failure) => emit(
                  ErrorState(failure.toString()),
                ),
            (data) => emit(LoadingState()));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });

    on<DeleteProductEvent>((event, emit) async {
      try {
        final result = await productRepositoryImpl.deleteProduct(event.id);
        result.fold(
            (failure) => emit(
                  ErrorState(failure.toString()),
                ),
            (data) => emit(LoadingState()));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });

    on<CreateProductEvent>((event, emit) async {
      try {
        final result =
            await productRepositoryImpl.insertProduct(event.productEntity);
        result.fold(
            (failure) => emit(
                  ErrorState(failure.toString()),
                ),
            (data) => true);
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
