import 'package:first_application/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUp(
    () {
      mockDataConnectionChecker = MockDataConnectionChecker();
      networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
    },
  );
  group('isConnected', () {
    test('should forward the call to interntconnectionchecker', () async {
      final tHasConncetionFuture = Future.value(true);

      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConncetionFuture);

      final result = networkInfo.isConnected;

      verify(mockDataConnectionChecker.hasConnection);

      expect(result, tHasConncetionFuture);
    });
  });
}
