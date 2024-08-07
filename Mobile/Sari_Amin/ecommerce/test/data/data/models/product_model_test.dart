import 'dart:convert';

import 'package:ecommerce/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/json_reader.dart';

void main() {
  const testProductModel = ProductModel(
    id: 1,
    name: "jordan",
    price: 220,
    description: "odifnhvasdiovnsdo",
    imageUrl: "asset/images/jordan.jpg",
  );

  test(
    'should be subclass of product',
    () async {
      expect(testProductModel, isA(ProductEntity));
    },
  );

  test(
    "should return json formatted data",
    () async {
      //arrange
      final Map<String, dynamic> jsonMap = jsonDecode(readJson('helpers/dummy_data/dummy_product_response.json'))
      //act
      //expect
    },
  );
}
