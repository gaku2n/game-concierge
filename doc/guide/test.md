# Flutter テスト戦略ガイド

Test-Driven Development (TDD) と Testing Trophy 原則に基づく、メンテナンス性重視のテスト戦略。

## テスト戦略の原則

### Testing Trophy アプローチ

Kent C. Dodds の Testing Trophy に基づいた配分：

**Testing Trophy の比率:**
- **Static Tests**: 30% - Analyzer・Lint・Format
- **Unit Tests**: 15% - エッジケース・純粋関数  
- **Integration Tests**: 50% - 最重要の領域
- **E2E Tests**: 5% - 最小限のクリティカルフロー

**Testing Trophy の原則**: "Write tests. Not too many. Mostly integration."

**重要：Flutter用語との対応関係**
| Testing Trophy | Flutter用語 | 実装場所 | 説明 |
|---|---|---|---|
| Static | Static Analysis | `analysis_options.yaml` | Dart analyzer, lint, format |
| Unit | Unit Test | `test/unit/` | ビジネスロジック・純粋関数 |
| Integration | **Widget Test** | `test/widget/` | 画面・状態変化・機能連携 |
| E2E | **Integration Test** | `integration_test/` | アプリ全体のユーザーフロー |

**本ドキュメントでの用語統一ルール:**
- 以降、Flutter標準用語（Widget Test / Integration Test）を使用
- Testing Trophyとしての「Integration」はWidget Testを指す

### 基本方針

- **Test-Driven Development (TDD)**: Red-Green-Refactor サイクルでの開発
- **Test Matrix 思考**: 頻度 × リスクで優先度を決定
- **メンテナンス性重視**: 過度なテストは避け、価値のあるテストのみ実装
- **Robot Pattern**: Integration test での再利用性確保
- **日本語テスト**: すべてのテスト名・説明は日本語で記述すること

## ディレクトリ構造

```
project/
├── analysis_options.yaml        # Static (30%) - lint・format・型チェック
├── test/                        # 65% - Unit + Widget + Golden
│   ├── unit/                    # Unit (15%) - エッジケース・純粋関数
│   │   ├── core/                # 計算ロジック・バリデーション
│   │   └── features/*/usecase/  # ビジネスロジック
│   ├── widget/                  # Integration (50%) - 複数機能の連携
│   │   ├── features/*/ui/       # 画面状態変化
│   │   └── common_widgets/      # 画面状態変化
│   ├── golden/                  # Visual Regression Test
│   │   ├── screens/             # 画面レイアウトの視覚確認
│   │   └── components/          # デザインシステムの一貫性
│   └── helpers/                 # テストヘルパー
└── integration_test/        # E2E (5%) - 最小限
    ├── robots/              # Robot Pattern
    └── critical_flows/      # ビジネスクリティカルのみ
```

## 1. Static Tests (30%)

**対象**: Dart analyzer, lint, format, 型チェック
**実装**: IDE + CI/CD (`dart analyze`, `dart format --set-exit-if-changed`)

## 2. Unit Tests (15%)

### 対象と目的

#### **✅ 必須テスト**
- **UseCase**: 複雑なビジネスロジック
- **Core**: バリデーション・変換処理

#### **❌ テスト不要**
- 単純な getters/setters
- freezed の自動生成コード
- Notifier (Integration test でカバー)

**粒度**: 正常系・異常系・境界値

## 3. Widget Tests (50% - Testing Trophyでの Integration)

### 対象：状態変化のある Widget のみ

#### **✅ テストする価値あり**

- **状態変化**: Toggle、Form validation、Custom dropdown
- **エッジケース**: エラー状態、ローディング状態
- **複雑な UI**: 計算結果表示、検索フィルター

#### **❌ テスト不要**

- 静的表示のみの Widget
- 単純な Text、Icon 表示
- Scaffold のみの画面

### テスト観点

- **状態変化**: 初期状態→操作→変化後の状態
- **ユーザー操作**: タップ、入力、スワイプの反応
- **表示切り替え**: 条件による表示内容の変化

## 4. Golden Tests (Visual Regression) - Alchemist 使用

### Alchemist 設定

#### 依存関係
```yaml
dev_dependencies:
  alchemist: ^0.7.0
```

#### 実装パターン
- **画面単位**: 基本状態 + 主要な状態変化
- **コンポーネント単位**: デザインシステムの要素
- **テーマ単位**: Light/Dark mode 対応

### 対象：1 画面 1 個 + 状態パターン

#### **✅ Golden Test 対象**

- **主要画面**: 各画面の基本レイアウト
- **デザインシステム**: AppButton、AppCard 等
- **テーマ**: Light/Dark mode 対応
- **複雑なレイアウト**: ProductCard、UserProfile 等

#### **❌ Golden Test 不要**

- 単純なリスト表示
- テキストのみの画面
- 標準 Widget 組み合わせのみ

### 実装指針

- **ファイル命名**: `{screen_name}_test.dart`
- **状態網羅**: 初期・ローディング・エラー・成功
- **テーマ対応**: Light/Dark の両方確認

## 5. Integration Tests (5%) - Robot Pattern

### Robot Pattern 設計

#### 構造
- **画面単位**での Robot クラス作成
- **チェーンメソッド**での操作連携
- **型安全**な画面遷移表現

#### 実装方針
- UI 操作の抽象化
- テストコードの再利用性確保
- メンテナンス性の向上

### 対象：ユーザーフローとクリティカルパス

#### **✅ Integration Test 対象**

- **主要フロー**: ログイン → メイン機能 → ログアウト
- **ビジネスクリティカル**: 決済、データ同期
- **フレーバー確認**: dev/stg/prod 環境
- **回帰防止**: 重要なバグの再現防止

### テストシナリオ

- **ハッピーパス**: 正常なユーザーフロー
- **エラーハンドリング**: 入力エラー・ネットワークエラー
- **状態遷移**: 画面間の適切な遷移確認

## TDD ワークフロー

1. **🔴 Red**: テスト作成・失敗確認
2. **🟢 Green**: 最小実装・テスト通過
3. **🔵 Refactor**: 設計改善・全テスト確認

## 環境設定

### 必要な依存関係

#### pubspec.yaml

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  integration_test:
    sdk: flutter
  alchemist: ^0.7.0 # Golden tests
  mockito: ^5.4.0 # Mocking
  build_runner: ^2.4.0 # Code generation
```

### テスト実行コマンド

```bash
# 全テスト実行
fvm flutter test

# Unit tests のみ
fvm flutter test test/unit/

# Widget tests のみ
fvm flutter test test/widget/

# Golden tests のみ
fvm flutter test test/golden/

# Integration tests のみ（基本実行）
fvm flutter test integration_test/

# Integration tests（スクリーンショット付き）
fvm flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/app_test.dart

# カバレッジ付きテスト実行
fvm flutter test --coverage

# 特定のテストファイル
fvm flutter test test/unit/features/auth/usecase/login_usecase_test.dart
```

## 品質基準

**カバレッジ目標**: Testing Trophy 比率に従い、Integration test 中心
**品質チェック**: `flutter analyze`, `dart format`, `dependency_validator`

## ベストプラクティス

**Do**: TDD開発、Robot Pattern、Test Matrix優先度判断、日本語でのテスト記述
**Don't**: 全クラステスト、ネイティブUI Golden test、getters/setters テスト、英語でのテスト名

## トラブルシューティング

- **Golden差分**: `--update-goldens`
- **E2E不安定**: `pumpAndSettle()`使用、ネットワーク依存排除
- **Mock エラー**: `build_runner` 実行、interface 確認
