import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:game_concierge/features/sample/state/users_notifier.dart';
import 'package:game_concierge/features/sample/state/posts_notifier.dart';

/// サンプル画面 - 正しいアーキテクチャのデモンストレーション
/// UI -> State -> UseCase -> Repository の依存関係を示す
class SampleScreen extends HookConsumerWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample - Clean Architecture Demo'),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: 'Users'),
            Tab(text: 'Posts'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [_UsersTab(), _PostsTab()],
      ),
    );
  }
}

/// ユーザー一覧タブ
class _UsersTab extends ConsumerWidget {
  const _UsersTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersNotifierProvider);

    return usersAsync.when(
      data: (users) => RefreshIndicator(
        onRefresh: () async {
          await ref.read(usersNotifierProvider.notifier).refresh();
        },
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
              leading: CircleAvatar(child: Text(user.id.toString())),
            );
          },
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $error'),
            ElevatedButton(
              onPressed: () => ref.refresh(usersNotifierProvider),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

/// 投稿一覧タブ
class _PostsTab extends ConsumerWidget {
  const _PostsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsNotifierProvider);

    return postsAsync.when(
      data: (posts) => RefreshIndicator(
        onRefresh: () async {
          await ref.read(postsNotifierProvider.notifier).refresh();
        },
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(post.title),
                subtitle: Text(
                  post.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text('ID: ${post.id}'),
              ),
            );
          },
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $error'),
            ElevatedButton(
              onPressed: () => ref.refresh(postsNotifierProvider),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
