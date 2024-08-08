import 'package:first_application/features/product/data/data_sources/remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:mockito/mockito.dart';

import '../../../helpers/json_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late ProductRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = ProductRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get response from api', () {
    const testId = 1;

    test('should reponse json', () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(readJson('trivia.json'), 200),
      );
      // act
      dataSource.getProductById(testId as String);
      // assert
      verify(mockHttpClient.get(
        'http://fakestoreapi.com/$testId' as Uri,
        headers: {'Content-Type': 'application/json'},
      ));
    });
  });
}
