import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:game_concierge/features/sample/model/post.dart';
import 'package:game_concierge/features/sample/usecase/posts_usecase.dart';

part 'posts_notifier.g.dart';

/// 投稿一覧の状態管理
/// UI層はこのプロバイダーを監視して投稿一覧を表示
@riverpod
class PostsNotifier extends _$PostsNotifier {
  @override
  Future<List<Post>> build() async {
    // UseCaseを通してビジネスロジックを適用した投稿一覧を取得
    final postsUseCase = ref.watch(postsUseCaseProvider);
    return await postsUseCase.getPosts();
  }

  /// 特定ユーザーの投稿一覧を取得
  Future<void> loadUserPosts(int userId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final postsUseCase = ref.read(postsUseCaseProvider);
      return await postsUseCase.getPosts(userId: userId);
    });
  }

  /// 投稿一覧を手動で更新
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final postsUseCase = ref.read(postsUseCaseProvider);
      return await postsUseCase.getPosts();
    });
  }
}
