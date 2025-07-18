import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:game_concierge/features/sample/repository/sample_repository.dart';
import 'package:game_concierge/features/sample/model/post.dart';

part 'posts_usecase.g.dart';

/// PostsUseCaseを提供するプロバイダー
@riverpod
PostsUseCase postsUseCase(Ref ref) {
  final repository = ref.watch(sampleRepositoryProvider);
  return PostsUseCase(repository: repository);
}

/// 投稿関連のビジネスロジック
class PostsUseCase {
  PostsUseCase({required SampleRepository repository})
    : _repository = repository;

  final SampleRepository _repository;

  /// 投稿一覧を取得
  /// ビジネスルール: タイトルが空でない投稿のみを新しい順でソート
  Future<List<Post>> getPosts({int? userId, int? limit, int? page}) async {
    final posts = await _repository.getPosts(
      userId: userId,
      limit: limit,
      page: page,
    );

    // ビジネスロジック: フィルタリングとソート
    return posts
        .where((post) => post.title.trim().isNotEmpty) // 有効なタイトルを持つ投稿のみ
        .where((post) => post.body.trim().isNotEmpty) // 有効な本文を持つ投稿のみ
        .toList()
      ..sort((a, b) => b.id.compareTo(a.id)); // ID降順（新しい順）
  }

  /// 特定の投稿を取得
  Future<Post> getPost(int id) async {
    if (id <= 0) {
      throw ArgumentError('Post ID must be positive');
    }

    return await _repository.getPost(id);
  }

  /// 新規投稿を作成
  /// ビジネスルール: タイトルと本文の検証
  Future<Post> createPost(Post post) async {
    _validatePost(post);

    // ビジネスロジック: 投稿内容のサニタイズ
    final sanitizedPost = Post(
      userId: post.userId,
      id: post.id,
      title: post.title.trim(),
      body: post.body.trim(),
    );

    return await _repository.createPost(sanitizedPost);
  }

  /// 投稿を更新
  /// ビジネスルール: タイトルと本文の検証
  Future<Post> updatePost(Post post) async {
    _validatePost(post);

    // ビジネスロジック: 投稿内容のサニタイズ
    final sanitizedPost = Post(
      userId: post.userId,
      id: post.id,
      title: post.title.trim(),
      body: post.body.trim(),
    );

    return await _repository.updatePost(sanitizedPost);
  }

  /// 投稿を削除
  Future<void> deletePost(int id) async {
    if (id <= 0) {
      throw ArgumentError('Post ID must be positive');
    }

    await _repository.deletePost(id);
  }

  /// 投稿の検証ロジック
  void _validatePost(Post post) {
    if (post.title.trim().isEmpty) {
      throw ArgumentError('Post title cannot be empty');
    }

    if (post.body.trim().isEmpty) {
      throw ArgumentError('Post body cannot be empty');
    }

    if (post.title.length > 100) {
      throw ArgumentError('Post title cannot exceed 100 characters');
    }

    if (post.body.length > 1000) {
      throw ArgumentError('Post body cannot exceed 1000 characters');
    }
  }
}