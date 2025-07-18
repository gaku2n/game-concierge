import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:game_concierge/features/home/state/home_tab_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(homeTabNotifierProvider);
    final notifier = ref.watch(homeTabNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(selectedIndex == 0 ? 'ホーム' : '設定')),
      body: IndexedStack(
        index: selectedIndex,
        children: const [_HomeTabContent(), _SettingsTabContent()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: notifier.selectTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
        ],
      ),
    );
  }
}

class _HomeTabContent extends StatelessWidget {
  const _HomeTabContent();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to TestApp',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text('これはホーム画面です', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class _SettingsTabContent extends StatelessWidget {
  const _SettingsTabContent();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('設定画面のプレースホルダー', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
