/// アプリケーションの環境区分を管理するFlavor enum
///
/// この拡張enumは、異なるアプリケーション環境（dev/stg/prod）への
/// 型安全なアクセスを提供します。
enum Flavor {
  /// 開発環境
  dev,

  /// ステージング環境
  stg,

  /// 本番環境
  prod;

  /// dart-define設定に基づいて現在のflavorを取得
  ///
  /// --dart-define flavor=value で指定されたflavorを返します
  /// 有効なflavorが指定されていない場合は[Flavor.dev]をデフォルトとして返します
  static Flavor get current {
    const flavorName = String.fromEnvironment('flavor', defaultValue: 'dev');

    switch (flavorName) {
      case 'dev':
        return Flavor.dev;
      case 'stg':
        return Flavor.stg;
      case 'prod':
        return Flavor.prod;
      default:
        // 不正なflavor値の場合は安全のためdevをデフォルトとする
        return Flavor.dev;
    }
  }

  @override
  String toString() => 'Flavor.$name';
}

/// Flavor拡張でAPI設定を提供
extension FlavorApiConfig on Flavor {
  /// APIのベースURL
  String get apiBaseUrl {
    // TODO(gaku2n): 具体的なURL
    return 'https://jsonplaceholder.typicode.com';
  }

  /// 接続タイムアウト
  Duration get connectTimeout => const Duration(seconds: 10);

  /// 受信タイムアウト
  Duration get receiveTimeout => const Duration(seconds: 30);

  /// 送信タイムアウト
  Duration get sendTimeout => const Duration(seconds: 30);

  /// 詳細ログを有効にするか
  bool get enableDetailedLog => this == Flavor.dev;

  /// ログでセンシティブ情報をマスクするか
  bool get maskSensitiveData => this != Flavor.dev;
}
