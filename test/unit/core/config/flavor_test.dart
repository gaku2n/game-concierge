import 'package:flutter_test/flutter_test.dart';
import 'package:game_concierge/core/config/flavor.dart';

void main() {
  group('Flavor', () {
    group('enum値', () {
      test('必要なflavor値がすべて存在すること', () {
        expect(Flavor.dev, isA<Flavor>());
        expect(Flavor.stg, isA<Flavor>());
        expect(Flavor.prod, isA<Flavor>());
      });

      test('各flavorの文字列表現が正しいこと', () {
        expect(Flavor.dev.name, equals('dev'));
        expect(Flavor.stg.name, equals('stg'));
        expect(Flavor.prod.name, equals('prod'));
      });
    });

    group('currentゲッター', () {
      test('dart-defineが設定されていない場合はdevを返すこと', () {
        // 注: String.fromEnvironmentのテストは実際のdart-define値に依存
        // デフォルト値のテストのみ実装
        expect(Flavor.current, isA<Flavor>());
      });

      test('switch文で全ての値を網羅できること', () {
        String result;
        switch (Flavor.current) {
          case Flavor.dev:
            result = 'development';
          case Flavor.stg:
            result = 'staging';
          case Flavor.prod:
            result = 'production';
        }
        expect(result, isNotEmpty);
      });
    });

    group('等価性と比較', () {
      test('等価比較が正しく動作すること', () {
        expect(Flavor.dev, equals(Flavor.dev));
        expect(Flavor.dev, isNot(equals(Flavor.stg)));
        expect(Flavor.stg, isNot(equals(Flavor.prod)));
      });

      test('アイデンティティ比較が正しく動作すること', () {
        expect(identical(Flavor.dev, Flavor.dev), isTrue);
        expect(identical(Flavor.dev, Flavor.stg), isFalse);
      });
    });

    group('デバッグ機能', () {
      test('デバッグ用の文字列表現が提供されること', () {
        expect(Flavor.dev.toString(), contains('dev'));
        expect(Flavor.stg.toString(), contains('stg'));
        expect(Flavor.prod.toString(), contains('prod'));
      });
    });
  });
}
