# GameConcierge

Flutter Bootstrapで生成されたマルチフレーバー対応のFlutterアプリケーションです。

## セットアップ

```bash
# 依存関係のインストール
fvm flutter pub get

# コード生成
fvm dart run build_runner build --delete-conflicting-outputs
```

## 実行

※ VS CodeのRun and Debugからも実行可能（Flutter拡張機能インストール後）

### 各環境での実行
```bash
# 開発環境
fvm flutter run --flavor dev --dart-define-from-file=dart_defines/dev.env

# ステージング環境
fvm flutter run --flavor stg --dart-define-from-file=dart_defines/stg.env

# 本番環境
fvm flutter run --flavor prod --dart-define-from-file=dart_defines/prod.env
```

### ビルド
```bash
# Android APK（本番）
fvm flutter build apk --flavor prod --dart-define-from-file=dart_defines/prod.env

# iOS（本番）
fvm flutter build ios --release --flavor prod --dart-define-from-file=dart_defines/prod.env
```

## 開発コマンド

```bash
# テスト実行
fvm flutter test

# 静的解析
fvm flutter analyze

# コードフォーマット
fvm dart format .
```

## ドキュメント構造

このプロジェクトのドキュメントは `doc/` ディレクトリにまとめられています。

- `doc/guide/`: アーキテクチャ、機能、テストに関するガイドラインです。
  - `architecture.md`: 全体のソフトウェアアーキテクチャについて説明します。
  - `features.md`: 実装済みの機能一覧です。
  - `test.md`: テスト戦略について記述します。
- `doc/requirement/`: AI用要件定義を格納します。
- `doc/workflow/`: AI用開発ワークフローの定義や図を格納します。

## 前提条件

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [FVM (Flutter Version Management)](https://fvm.app/)
- iOS開発: Xcode
- Android開発: Android Studio

## Claude Code カスタムコマンド

開発ワークフロー用のカスタムコマンドが利用できます：

- `/req` - 要件定義書作成
- `/task` - タスクシート作成
- `/impl` - 機能実装
- `/fix-review` - PRレビュー対応
- `/review-pr` - PRレビュー
- `/fix-doc` - ドキュメント改善

詳細は`doc/workflow/overview.md`を参照。

## ライセンス

[ライセンス情報をここに記載]
