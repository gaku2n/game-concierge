import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DebugHomeScreen extends HookConsumerWidget {
  const DebugHomeScreen({super.key, this.onNavigate});

  final void Function(String route)? onNavigate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Debug Home')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _AppInfoSection(),
          const SizedBox(height: 24),
          _RoutesSection(onNavigate: onNavigate),
        ],
      ),
    );
  }
}

class _AppInfoSection extends StatelessWidget {
  const _AppInfoSection();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'アプリ情報',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                final info = snapshot.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('アプリ名: ${info.appName}'),
                    Text('バージョン: ${info.version}'),
                    Text('ビルド番号: ${info.buildNumber}'),
                    Text('パッケージ名: ${info.packageName}'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _RoutesSection extends StatelessWidget {
  const _RoutesSection({this.onNavigate});

  final void Function(String route)? onNavigate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '利用可能なルート',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _RouteButton(
              title: 'ホーム画面へ',
              route: '/home',
              icon: Icons.home,
              onNavigate: onNavigate,
            ),
            const SizedBox(height: 8),
            _RouteButton(
              title: '404エラー画面へ',
              route: '/404',
              icon: Icons.error_outline,
              onNavigate: onNavigate,
            ),
          ],
        ),
      ),
    );
  }
}

class _RouteButton extends StatelessWidget {
  const _RouteButton({
    required this.title,
    required this.route,
    required this.icon,
    this.onNavigate,
  });

  final String title;
  final String route;
  final IconData icon;
  final void Function(String route)? onNavigate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          if (onNavigate != null) {
            onNavigate!(route);
          } else {
            context.go(route);
          }
        },
        icon: Icon(icon),
        label: Text(title),
        style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
      ),
    );
  }
}
