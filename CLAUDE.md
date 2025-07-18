# CLAUDE.md

このファイルは、このリポジトリでコードを扱う際のClaude Code (claude.ai/code)へのガイダンスを提供します。

## プロジェクト概要

[プロジェクトの簡潔な説明 - 何をするものかとその主な目的]

## コマンド

### 開発コマンド

```bash
# 開発用にアプリを起動
fvm flutter run --dart-define-from-file=dart_defines/dev.env

# テストを実行
fvm flutter test
```

### セットアップコマンド

```bash
# 依存関係をインストール
fvm flutter pub get

# コード生成
fvm dart run build_runner build -d
```

## 主要ファイルとユーティリティ

### キーファイル

- `lib/main.dart` - フレーバー設定を含むアプリケーションエントリーポイント
- `dart_defines/*.env` - 環境設定ファイル（dev/stg/prod）

### ユーティリティ機能

- `package_info_plus`経由でのアプリメタデータ

## ドキュメント構造

このプロジェクトのドキュメントは`doc/`ディレクトリに整理されています。ドキュメントの作成や更新を求められた場合は、既存の構造を参照してください。

- `doc/guide/`: アーキテクチャ、機能、テストに関するガイダンスを含む
  - `architecture.md`: 全体的なソフトウェアアーキテクチャを説明
  - `features.md`: 実装された機能一覧
  - `test.md`: テスト戦略を記述
  - `doc.md`: 一般的なドキュメントガイドライン
- `doc/requirement/`: 要件関連ドキュメント用
- `doc/workflow/`: ワークフロー定義と図表を含む
  - `*.yaml`: 特定のワークフローを定義するYAMLファイル（例：`fix-review.yaml`、`implements.yaml`）
  - `overview.md`: 開発ワークフローの概要


## コードスタイル

### Dart規約

- 変数と関数にはcamelCaseを使用
- クラスと型にはPascalCaseを使用
- 可能な限り`var`より`final`を優先
- より良いdiffのためにトレーリングカンマを使用
- その他詳細な規約については、analysis_options.yamlを参照

### 状態管理

- 状態管理にはRiverpodとFlutter Hooksを使用
- ウィジェット内で完結する状態管理にはFlutter Hooksを使用
- 可能な限りプロバイダーにはコード生成を使用

## テスト

```bash
# 全テストを実行
fvm flutter test

# カバレッジ付きでテストを実行
fvm flutter test --coverage
```

## ワークフロー

- GitHub-Flowを使用

### ワークフロー遵守

- **重要**: ワークフローコマンド（`/req`、`/impl`など）が実行された場合、`doc/workflow/`内の対応するワークフローファイルに厳密に従う
- **絶対に**フェーズをスキップしたり、定義されたワークフローに従わずに直接実装に進んではいけない
- 各ワークフローはYAML定義で指定された正確な順序で完了する必要がある
- **グローバルワークフロー**: `/concept`でアプリ全体コンセプトを決定（`doc/workflow/concept.yaml`に従う）
- **機能ワークフロー**: 機能別に`/req` → `/task` → `/impl` → `/fix-review`の順で開発

### ブランチ命名

- `feature/description`

### 開発プロセス

**全体設計フェーズ**:
1. ペルソナとユーザーフローを使ったアプリケーションコンセプトの設計（`/concept`）

**機能開発フェーズ（機能別に繰り返し）**:
1. mainから機能ブランチを作成
2. 機能要件を記述（`/req`）
3. 技術的タスクシートを作成（`/task`）
4. 機能を実装（`/impl`）
5. レビューと修正（`/fix-review`）
6. プルリクエストを作成

**コマンドフロー**:
- **全体像**: `/concept`
- **機能別**: `/req` → `/task` → `/impl` → `/fix-review`

### マージ戦略

- mainのヒストリーをクリーンに保つため、機能ブランチをマージする際は**必ずコミットをsquash**する
- 1つの機能 = mainブランチの1つのコミット
- 必要に応じてマージ前に機能ブランチをmainにrebaseする
- 常にプルリクエストを使用 - mainへの直接プッシュは禁止

### コミット前

- `fvm flutter analyze`を実行して問題をチェック
- `fvm flutter test`を実行してテストが通ることを確認
- `fvm dart format .`でコードをフォーマット

## 開発環境セットアップ

### 前提条件

- **Flutter SDK** - バージョン管理にFVMを使用
- **FVMインストール**: `dart pub global activate fvm`
- **プロジェクトセットアップ**: プロジェクトルートで`fvm install`を実行
- **IDE**: Flutter/Dart拡張を持つVS CodeまたはCursor

### プラットフォーム固有のセットアップ

#### iOS開発

- Xcode（最新安定版）
- iOSシミュレーターまたは実機
- デバイステスト用のApple Developerアカウント
- セットアップ後に`flutter config --select-ios-signing-settings`を実行

#### Android開発

- SDK付きのAndroid Studio
- Androidエミュレーターまたは実機
- 実機では開発者オプションとUSBデバッグを有効化

### 環境設定

#### フレーバー

このプロジェクトは3つのフレーバーを使用:

- `dev` - 開発環境
- `stg` - ステージング環境
- `prod` - プロダクション環境

#### 環境ファイル

設定は`dart_defines/*.env`ファイルで管理:

- `dart_defines/dev.env` - 開発設定
- `dart_defines/stg.env` - ステージング設定
- `dart_defines/prod.env` - プロダクション設定

## プロジェクト固有の警告

### マルチフレーバーの動作

- **重要**: 実行/ビルド時は必ず`--dart-define-from-file`を使用
- **iOS**: フレーバーごとにBundle IDが変更される
- **Android**: フレーバーごとにApplication IDが変更される

## よくある問題

### 既知の問題

- iOSシミュレーターはテスト用に手動起動が必要な場合がある
- Androidエミュレーターの自動起動には15秒の遅延がある

### トラブルシューティング

- **ビルド失敗**: `flutter clean && fvm flutter pub get`を実行
- **iOS問題**: 署名証明書を確認、Xcodeを再起動
- **Android問題**: SDKを確認、エミュレーターを再起動、デバイス接続を確認
- **フレーバー問題**: 正しい`.env`ファイルが存在し、適切にフォーマットされていることを確認
