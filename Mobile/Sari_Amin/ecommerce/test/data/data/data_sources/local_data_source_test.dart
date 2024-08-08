import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:first_application/features/product/data/data_sources/local_data_source.dart';
import 'package:first_application/features/product/data/models/product_model.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helpers/json_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late ProductLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource =
        ProductLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });
  const testId = '1';
  group('get from local data scoure and cache data to sharedPrefernces', () {
    final testProductModel =
        ProductModel.fromJson(json.decode(readJson('product_cached.json')));

    test('get from local data source', () async {
      when(mockSharedPreferences.getString(any))
          .thenReturn(readJson('product_cached.json'));

      final result = await dataSource.getProductById(testId);
      verify(mockSharedPreferences.getString(CACHED_PRODUCT));
      expect(result, equals(testProductModel));
    });
  });
}
