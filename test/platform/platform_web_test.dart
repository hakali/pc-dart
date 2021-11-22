@TestOn('browser')
import 'package:pointycastle_pc335/src/platform_check/platform_check.dart';
import 'package:test/test.dart';

void main() {
  test('is not native', () {
    expect(Platform.instance.platform, equals("web"));
    expect(Platform.instance.isNative, equals(false));
    expect(Platform.instance.fullWidthInteger, equals(false));
  });

  test('width assertion', () {
    expect(() => {Platform.instance.assertFullWidthInteger()},
        throwsA(TypeMatcher<PlatformException>()));
  });
}
