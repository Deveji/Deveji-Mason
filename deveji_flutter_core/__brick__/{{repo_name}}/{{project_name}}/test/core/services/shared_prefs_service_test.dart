import 'package:{{project_name}}/core/services/shared_prefs_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SharedPrefs sharedPrefs;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    sharedPrefs = SharedPrefs();
    SharedPrefs.sharedPreferences = mockSharedPreferences;
  });

  test('Should initialize SharedPreferences', () async {
    when(mockSharedPreferences.getString('key')).thenReturn('test');
    await sharedPrefs.init();
    expect(sharedPrefs.prefs.getString('key'), 'test');
  });

  test('Should return SharedPreferences instance', () {
    expect(sharedPrefs.prefs, isNotNull);
  });

  test('Should throw if SharedPreferences not initialized', () {
    SharedPrefs.sharedPreferences = null;
    expect(() => sharedPrefs.prefs, throwsA(isA<AssertionError>()));
  });
}
