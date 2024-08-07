import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:first_application/core/error/exceptions.dart';
import 'package:first_application/features/product/data/models/product_model.dart';
import 'package:first_application/features/product/data/repository/product_repository_impl.dart';
import 'package:first_application/features/product/domian/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  late MockProductRemoteDataSource mockProductRemoteDataSource;
  late ProductRepositoyImpl productRepositoyImpl;
  const testProductModel = ProductModel(
      name: "jordan",
      price: 220,
      id: 1,
      imageUrl: "imageUrl",
      description: "description");
  const testProductEntity = ProductEntity(
      name: "jordan",
      price: 220,
      id: 1,
      imageUrl: "imageUrl",
      description: "description");
  setUp(() {
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    ProductRepositoyImpl = ProductRepositoyImpl(
        ProductRemoteDataSource: mockProductRemoteDataSource);
  });
  const testProductId = 1;
  group('get data',
    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(mockProductRemoteDataSource.getProductById(testProductId))
            .thenThrow(ServerException());

        // act
        final result = await productRepositoryImpl.getProduct(testProductId);

        // assert
        expect(
            result, equals(const Left(ServerFailure('An error has occurred'))));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockProductRemoteDataSource.getProductById(testProductId))
            .thenThrow(
                const SocketException('Failed to connect to the network'));

        // act
        final result = await productRepositoryImpl.getProduct(testProductId);

        // assert
        expect(result, equals(const Left(
                ConnectionFailure('Failed to connect to the network'))));
      },
    );
  );
}
