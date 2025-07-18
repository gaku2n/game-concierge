# Flutter アーキテクチャガイド

## ディレクトリ構成

```
project_root/
├── lib/
│   ├── main.dart                    # アプリケーションエントリーポイント
│   ├── app.dart                     # MaterialApp.routerを設定するMyAppウィジェット
│   ├── core/                        # インフラ・基盤機能
│   │   ├── config/                  # アプリ設定・環境設定
│   │   ├── network/                 # HTTPクライアント・API基盤
│   │   ├── storage/                 # ローカルストレージ基盤
│   │   ├── utils/                   # 汎用ユーティリティ関数
│   │   └── theme/                   # デザインシステム・テーマ設定
│   ├── routing/                     # ナビゲーション設定
│   │   ├── app_router.dart          # 全ルート定義 + GoRouter設定
│   │   └── app_router.g.dart        # 自動生成ファイル（.gitignoreに追加）
│   ├── common_widgets/              # 共有UIコンポーネント
│   │   └── *.dart                   # 再利用可能なWidget（AppButton、AppCardなど）
│   └── features/                    # 機能ベースモジュール（詳細はdoc/guide/features.md参照）
│       └── [feature_name]/          # 個別機能（auth、home、profileなど）
│           ├── model/               # データモデル（Freezed）
│           │   └── [entity].dart    # モデル定義
│           ├── datasource/          # データソース層
│           │   └── [feature]_api_client.dart # API クライアント（Retrofit）
│           ├── repository/          # リポジトリ層
│           │   └── [feature]_repository.dart # リポジトリ実装
│           ├── usecase/             # ビジネスロジック層
│           │   └── [entity]_usecase.dart    # UseCase実装
│           ├── state/               # 状態管理（Riverpod Notifier）
│           │   └── [entity]_notifier.dart   # Notifier実装
│           └── ui/                  # ユーザーインターフェース（ページ・ウィジェット）
│               └── [feature]_screen.dart    # 画面実装
├── test/                            # テストファイル（詳細はdoc/guide/test.md参照）
├── integration_test/                # E2E （詳細はdoc/guide/test.md参照）
├── assets/                          # 画像・フォント等のアセット
├── dart_defines/                    # 環境設定ファイル（dev.env、stg.env、prod.env）
├── doc/                             # プロジェクトドキュメント
│   ├── guide/                       # 開発ガイド
│   │   ├── architecture.md          # アーキテクチャガイド（このファイル）
│   │   ├── features.md              # 機能一覧・ディレクトリ構成
│   │   ├── http-client.md           # HTTP通信実装ガイド（Clean Architecture）
│   │   ├── test.md                  # テスト戦略
│   │   ├── l10n.md                  # 多言語対応ガイド
│   │   ├── logging.md               # ログ戦略
│   │   └── doc.md                   # ドキュメント戦略
│   ├── requirement/                 # 機能開発フロー（/req コマンド成果物）
├── pubspec.yaml                     # 依存関係・プロジェクト設定
├── analysis_options.yaml            # Linter設定
└── README.md                        # プロジェクト概要
```

## 機能間の依存関係

機能（features）間の依存関係は以下のルールに従う：

```
features/
├── auth/           # 基盤機能：他の機能から参照される
└── settings/       # auth に依存

共通依存:
- すべての機能は core/ を参照可能
- すべての機能は common_widgets/ を参照可能
- 機能間の相互依存は最小限に抑制
```

**依存関係の原則:**

- 上位機能は下位機能に依存してよい
- 下位機能は上位機能に依存してはならない
- 機能間の直接的な相互依存は避ける
- 共通機能は `core/` または `common_widgets/` に抽出
- ui -> state -> usecase -> repository -> datasource

## アーキテクチャ原則

### 機能優先の構成（Feature-First）

- 技術的な層ではなく、機能要件で整理
- 各機能は明確な境界を持つ自己完結型
- 機能を独立して開発・テスト可能

## 主要な設計判断

### 状態管理

- **アプリ全体・機能間**: Riverpod（`@riverpod`）を使用
- **Widget 内に閉じる状態**: flutter_hooks を積極的に使用
- 適切な場合は State、Notifier、Provider 定義を単一ファイルに統合
- テスタビリティ向上のためビジネスロジックは UseCase に配置

### ファイル命名規則

#### ディレクトリ命名
- 役割・層を表すディレクトリは単数形: `core/`、`routing/`、`ui/`
- 複数の具体的な要素を含むディレクトリは複数形: `features/`、`common_widgets/`
- Dart/Flutter 規則に従う: `lib/`（単数）、`assets/`（複数）

#### ファイル命名
**基本原則**: ファイル名はクラス名と一致させる（snake_case ↔ PascalCase）

**Notifier ファイル**:
- パターン: `{entity}_notifier.dart` → `{Entity}Notifier`クラス
- 例: `users_notifier.dart` → `UsersNotifier`クラス
- 例: `posts_notifier.dart` → `PostsNotifier`クラス

**UseCase ファイル**:
- パターン: `{entity}_usecase.dart` → `{Entity}UseCase`クラス
- 関連操作を1つのUseCaseクラスに統合
- 例: `users_usecase.dart` → `UsersUseCase`（`getUsers()`, `getUser(id)`メソッド）
- 例: `posts_usecase.dart` → `PostsUseCase`（`getPosts()`, `createPost()`, `deletePost()`メソッド）

**Repository ファイル**:
- パターン: `{entity}_repository.dart` → `{Entity}Repository`クラス
- 例: `users_repository.dart` → `UsersRepository`クラス

**Model ファイル**:
- パターン: `{entity}.dart` → `{Entity}`クラス（Freezed使用）
- 例: `user.dart` → `User`クラス
- 例: `post.dart` → `Post`クラス

**命名のベストプラクティス**:
- ❌ 冗長な接頭辞: `get_users_usecase.dart`, `users_state.dart`
- ✅ 簡潔で一貫性: `users_usecase.dart`, `users_notifier.dart`
- ✅ IDE検索フレンドリー: `UsersNotifier`で検索 → `users_notifier.dart`が即座にヒット
- ✅ 関連操作の統合: 単一/複数取得、CRUD操作を1つのUseCaseに

## 実装ガイドライン

### 新機能の追加

1. 機能ディレクトリを作成: `lib/features/[feature_name]/`
2. 必要に応じて層を実装（すべての機能にすべての層が必要ではない）
3. `lib/routing/app_router.dart`にルートを追加
4. `fvm dart run build_runner build`を実行してルートコードを生成

### 共有コンポーネントの追加

- **技術・インフラ**: `lib/core/`に追加
- **UI コンポーネント**: `lib/common_widgets/`に追加
- **アプリ設定**: `lib/core/config/`に追加

## 依存関係

### コア依存関係

- `go_router`: ナビゲーション・ルーティング
- `riverpod`: 状態管理
- `flutter_hooks`: Widget 内状態管理
- 標準 Flutter パッケージ

### 開発用依存関係

- `go_router_builder`: 型安全なルート生成
- `build_runner`: コード生成
- `flutter_test`: テストフレームワーク
- `retrofit`: 型安全なAPIクライアント生成
- `dio`: HTTP通信クライアント
- `freezed`: 不変データクラス生成

## ベストプラクティス

1. **シンプルに始める**: 早期の過度な設計を避け、必要に応じて複雑さを追加
2. **ビジネスロジックをテスト**: UseCase と Repository の単体テストに集中
3. **UI は愚直に**: ロジックを状態管理と UseCase に移動
4. **一貫した命名**: プロジェクト全体で確立された規則に従う
5. **決定を文書化**: アーキテクチャ変更時はこのファイルを更新
