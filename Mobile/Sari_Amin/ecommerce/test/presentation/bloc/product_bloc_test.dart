import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:first_application/core/error/failure.dart';
import 'package:first_application/features/product/data/repositories/product_repositorie_impl.dart';
import 'package:first_application/features/product/domain/entities/product.dart';
import 'package:first_application/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProductRepositoryImpl extends Mock implements ProductRepositoryImpl {}

void main() {
  late MockProductRepositoryImpl mockProductRepositoryImpl;

  late ProductBloc productBloc;
  setUp(() {
    mockProductRepositoryImpl = MockProductRepositoryImpl();
    productBloc = ProductBloc(mockProductRepositoryImpl);
  });
  test('should return the IinitialState', () async {
    expect(productBloc.state, InitialState);
  });
  const testProductEntity = ProductEntity(
      id: "6672752cbd218790438efdb0",
      name: "Anime website",
      description: "Explore anime characters.",
      price: 123,
      imageUrl:
          "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg");

  const testProductId = '6672752cbd218790438efdb0';

  group("Bloc test", () {
    blocTest<ProductBloc, ProductState>(
      'should insert produt ',
      build: () => ProductBloc(mockProductRepositoryImpl),
      setUp: () {
        when(mockProductRepositoryImpl.insertProduct(testProductEntity))
            .thenReturn(const Right(true) as Future<Either<Failure, bool>>);
      },
      act: (bloc) => bloc.add(const CreateProductEvent(testProductEntity)),
      expect: () => <ProductState>[LoadingState()],
    );

    blocTest<ProductBloc, ProductState>(
      'should return Error',
      build: () => ProductBloc(mockProductRepositoryImpl),
      setUp: () {
        when(mockProductRepositoryImpl.insertProduct(testProductEntity))
            .thenAnswer(throw Error());
      },
      act: (bloc) => bloc.add(const CreateProductEvent(testProductEntity)),
      expect: () => <ProductState>[const ErrorState("Error")],
    );

    blocTest<ProductBloc, ProductState>(
      'should delete product',
      build: () => ProductBloc(mockProductRepositoryImpl),
      setUp: () {
        when(mockProductRepositoryImpl.deleteProduct(testProductId))
            .thenReturn(const Right(true) as Future<Either<Failure, bool>>);
      },
      act: (bloc) => bloc.add(const DeleteProductEvent(testProductId)),
      expect: () => <ProductState>[LoadingState()],
    );

    blocTest<ProductBloc, ProductState>(
      'should return ErrorState on deleteProductEvent',
      build: () => ProductBloc(mockProductRepositoryImpl),
      setUp: () {
        when(mockProductRepositoryImpl.deleteProduct(testProductId))
            .thenAnswer(throw Error());
      },
      act: (bloc) => bloc.add(DeleteProductEvent as ProductEvent),
      expect: () => const <ProductState>[ErrorState("Error")],
    );
    blocTest<ProductBloc, ProductState>(
      'should return loadedAllProdcutState on LoadAllProductEvent',
      build: () => ProductBloc(mockProductRepositoryImpl),
      setUp: () {
        when(mockProductRepositoryImpl.getAllProduct()).thenReturn(
            const Right([]) as Future<Either<Failure, List<ProductEntity>>>);
      },
      act: (bloc) => bloc.add(LoadAllProductEvent()),
      expect: () => const <ProductState>[LoadedAllProductState([])],
    );
    blocTest<ProductBloc, ProductState>(
      'should return ErrorState on LoadAllProductEvent',
      build: () => ProductBloc(mockProductRepositoryImpl),
      setUp: () {
        when(mockProductRepositoryImpl.getAllProduct())
            .thenAnswer(throw Error());
      },
      act: (bloc) => bloc.add(LoadAllProductEvent()),
      expect: () => const <ProductState>[ErrorState("error")],
    );
    blocTest<ProductBloc, ProductState>(
      'should return LoadSingleProductState on GetSingleProductEvent',
      build: () => ProductBloc(mockProductRepositoryImpl),
      setUp: () {
        when(mockProductRepositoryImpl.getProduct(testProductId)).thenReturn(
            const Right(testProductEntity)
                as Future<Either<Failure, ProductEntity>>);
      },
      act: (bloc) => bloc.add(const GetSingleProductEvent(testProductId)),
      expect: () =>
          const <ProductState>[LoadedSingleProductState(testProductEntity)],
    );

    blocTest<ProductBloc, ProductState>(
      'should return ErrotState on GetSingleProductEvent',
      build: () => ProductBloc(mockProductRepositoryImpl),
      setUp: () {
        when(mockProductRepositoryImpl.getProduct(testProductId))
            .thenAnswer(throw Error());
      },
      act: (bloc) => bloc.add(const GetSingleProductEvent(testProductId)),
      expect: () => const <ProductState>[ErrorState("error")],
    );
  });
}
