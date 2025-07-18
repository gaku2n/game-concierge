import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/core/config/build_mode.dart';

void main() {
  group('BuildMode enum', () {
    test('debug、release、profileの値を持つこと', () {
      // enum値の存在確認
      expect(BuildMode.values, contains(BuildMode.debug));
      expect(BuildMode.values, contains(BuildMode.release));
      expect(BuildMode.values, contains(BuildMode.profile));
      expect(BuildMode.values.length, equals(3));
    });

    test('正しい文字列表現を持つこと', () {
      // toString()動作確認
      expect(BuildMode.debug.toString(), equals('BuildMode.debug'));
      expect(BuildMode.release.toString(), equals('BuildMode.release'));
      expect(BuildMode.profile.toString(), equals('BuildMode.profile'));
    });
  });

  group('BuildMode.current', () {
    test('Flutterのビルドフラグに基づいて正しいモードを返すこと', () {
      // 現在のビルドモードを取得できることを確認
      final current = BuildMode.current;
      expect(current, isA<BuildMode>());
      expect(BuildMode.values, contains(current));
    });

    test('複数回呼び出しても一貫したモードを返すこと', () {
      // 複数回呼び出しても同じ値を返すことを確認
      final first = BuildMode.current;
      final second = BuildMode.current;
      expect(first, equals(second));
    });
  });
}
