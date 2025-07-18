import 'package:simple_logger/simple_logger.dart';
import 'package:game_concierge/core/config/flavor.dart';

/// アプリ全体で統一されたロガーインスタンス
/// logging.mdに基づき、以下のログレベルだけ用いること
/// **FINE**: 変数値、処理フロー確認
/// **INFO**: アプリ起動、重要処理完了
/// **WARNING**: 通信エラー、リトライ可能問題
/// **SEVERE**: クラッシュ要因、修正必須例外
final logger = SimpleLogger()
  ..setLevel(
    _getLogLevelByFlavor(),
    includeCallerInfo: _shouldIncludeCallerInfo(),
  )
  ..onLogged = (log, info) {
    if (info.level == Level.SEVERE) {
      // TODO(gaku2n): Crashlytics等にエラーログを送信
      // WARNINGは要検討
    }
  };

/// Flavor別ログレベル取得
/// dev: FINE以上（全ログ）
/// stg/prod: WARNING以上（エラー・例外のみ）
Level _getLogLevelByFlavor() {
  switch (Flavor.current) {
    case Flavor.dev:
      return Level.FINE;
    case Flavor.stg:
    case Flavor.prod:
      return Level.WARNING;
  }
}

/// Flavor別呼び出し元情報表示制御
/// dev: 呼び出し元情報表示（デバッグ用）
/// stg/prod: パフォーマンス優先で無効化
bool _shouldIncludeCallerInfo() {
  switch (Flavor.current) {
    case Flavor.dev:
      return true;
    case Flavor.stg:
    case Flavor.prod:
      return false;
  }
}
