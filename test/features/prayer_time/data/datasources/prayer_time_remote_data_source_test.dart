import 'package:flutter_test/flutter_test.dart';
import 'package:jadwal_solat/features/prayer_time/data/datasources/prayer_time_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockClient;
  late PrayerTimeRemoteDataSource remote;

  setUp(() {
    mockClient = MockHttpClient();
    remote = PrayerTimeRemoteDataSourceImpl(client: mockClient);
    registerFallbackValue(Uri());
  });

  const tMap = {
    'Fajr': '05:40 (WIB)',
    'Sunrise': '06:38 (WIB)',
    'Dhuhr': '12:43 (WIB)',
    'Asr': '15:44 (WIB)',
    'Sunset': '18:48 (WIB)',
    'Maghrib': '18:48 (WIB)',
    'Isha': '19:45 (WIB)',
    'Imsak': '05:30 (WIB)',
    'Midnight': '00:43 (WIB)',
    'Firstthird': '22:44 (WIB)',
    'Lastthird': '02:41 (WIB)',
  };

  test('Should ', () async {
    // arrange
    when(() => mockClient.get(any()))
        .thenAnswer((_) async => http.Response(tMap.toString(), 200));
    // act
    await remote.getPrayerTime(2024, 1, 30);
    // assert
    verify(() => mockClient).called(1);
  });
}
