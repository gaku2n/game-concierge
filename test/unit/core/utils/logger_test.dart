import 'package:flutter_test/flutter_test.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:test_app/core/config/flavor.dart';
import 'package:test_app/core/utils/logger.dart';

void main() {
  group('Logger基本機能テスト', () {
    test('loggerインスタンスが正常に作成される', () {
      expect(logger, isNotNull);
      expect(logger, isA<SimpleLogger>());
    });

    test('4段階ログレベルでログ出力できる', () {
      expect(() => logger.fine('FINE level test'), returnsNormally);
      expect(() => logger.info('INFO level test'), returnsNormally);
      expect(() => logger.warning('WARNING level test'), returnsNormally);
      expect(() => logger.severe('SEVERE level test'), returnsNormally);
    });
  });

  group('Flavor拡張プロパティテスト', () {
    test('各Flavorの設定値が正しいこと', () {
      // dev環境の設定確認
      expect(Flavor.dev.enableDetailedLog, isTrue);
      expect(Flavor.dev.maskSensitiveData, isFalse);

      // stg環境の設定確認
      expect(Flavor.stg.enableDetailedLog, isFalse);
      expect(Flavor.stg.maskSensitiveData, isTrue);

      // prod環境の設定確認
      expect(Flavor.prod.enableDetailedLog, isFalse);
      expect(Flavor.prod.maskSensitiveData, isTrue);
    });
  });
}
