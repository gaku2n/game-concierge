import 'package:flutter/foundation.dart';

/// Flutterアプリのビルドモードを表現するenum
enum BuildMode {
  /// デバッグモード
  debug,

  /// リリースモード
  release,

  /// プロファイルモード
  profile;

  /// 現在のビルドモードを取得する
  static BuildMode get current {
    if (kDebugMode) {
      return BuildMode.debug;
    } else if (kReleaseMode) {
      return BuildMode.release;
    } else if (kProfileMode) {
      return BuildMode.profile;
    } else {
      // この分岐は理論上到達しないが、安全のため
      throw StateError('Unknown build mode');
    }
  }
}
