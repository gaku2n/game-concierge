import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:game_concierge/core/config/flavor.dart' show Flavor;
import 'package:game_concierge/features/debug/ui/debug_home_screen.dart'
    show DebugHomeScreen;

part 'app_router.g.dart';

/// ルートパス ("/") のルート定義
///
/// アプリケーションのエントリーポイント
/// [Flavor]に応じて適切な初期画面にリダイレクト
@TypedGoRoute<RootRoute>(path: '/')
class RootRoute extends GoRouteData with _$RootRoute {
  @override
  String? redirect(BuildContext context, GoRouterState state) =>
      _getInitialLocation();
}

/// デバッグ画面 ("/debug") のルート定義
///
/// 開発時のデバッグ用機能画面
/// 主に開発環境([Flavor.dev])で使用
@TypedGoRoute<DebugRoute>(path: '/debug')
class DebugRoute extends GoRouteData with _$DebugRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DebugHomeScreen();
}

/// ホーム画面 ("/home") のルート定義
///
/// アプリケーションのメイン画面
/// ステージング環境・本番環境での初期画面
@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData with _$HomeRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      // TODO(gaku2n): 要変更
      const Scaffold(body: Center(child: Text('Home')));
}

/// アプリケーション全体のルーティング管理
///
/// [go_router_builder]による型安全なルート設定
/// [Flavor]に応じた初期画面設定とエラーハンドリング
///
/// - 開発環境: デバッグ画面 ("/debug") を初期表示
/// - ステージング・本番環境: ホーム画面 ("/home") を初期表示
/// - 開発環境ではデバッグログ有効化
final appRouter = GoRouter(
  routes: $appRoutes,
  // TODO(gaku2n): 要変更
  /// ルーティングが存在しないときのエラー画面
  errorBuilder: (context, state) =>
      const Scaffold(body: Center(child: Text('Error'))),
  debugLogDiagnostics: Flavor.current == Flavor.dev,
);

/// [Flavor]に応じた初期画面パス取得
///
/// アプリケーション起動時の画面を環境別に決定
///
/// Returns:
/// - [Flavor.dev]: "/debug" (デバッグ画面)
/// - [Flavor.stg], [Flavor.prod]: "/home" (ホーム画面)
String _getInitialLocation() {
  switch (Flavor.current) {
    case Flavor.dev:
      return '/debug';
    case Flavor.stg:
    case Flavor.prod:
      return '/home';
  }
}
