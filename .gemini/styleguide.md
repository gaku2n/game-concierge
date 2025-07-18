# Flutter Style Guide

# Introduction

日本語でコメントすること。

# Key Principles

- **Security:** Enforce input validation and dependency vulnerability checks, and manage secrets securely.
- **Performance:** Minimize rebuilds using `const` constructors and `ListView.builder`/`GridView.builder`.
- **State Management:** Use a single solution (Provider, Riverpod, Bloc) to separate UI from business logic.
- **UX & Accessibility:** Follow touch-target (≥48×48 dp) and font-size guidelines, and support screen readers with `Semantics`.
- **i18n & l10n:** Manage all strings via `intl` (or similar), and format dates, numbers, and currency per locale.
- **Testability:** Cover business logic with unit tests and UI with widget/integration tests; run automatically in CI.
- **Consistency & Maintainability:** Standardize styles with `ThemeData` and reusable widgets; decompose large widgets.
- **Observability:** Collect crash reports (Crashlytics/Sentry) and performance metrics, and log custom events.
- **Portability:** Minimize platform-specific code (`kIsWeb`, `Platform.isAndroid`) and favor shared implementations.

# Code Review Process

このプロジェクトのコードレビューは、建設的で教育的なアプローチを採用しています。詳細なレビュープロセスについては、[プルリクエストレビューワークフロー](../doc/workflow/review-pr.yaml)を参照してください。
