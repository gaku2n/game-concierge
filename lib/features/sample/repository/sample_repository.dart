import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:game_concierge/features/sample/datasource/sample_api_client.dart';
import 'package:game_concierge/features/sample/model/post.dart';
import 'package:game_concierge/features/sample/model/user.dart';

part 'sample_repository.g.dart';

/// SampleRepositoryを提供するプロバイダー
@riverpod
SampleRepository sampleRepository(Ref ref) {
  final apiClient = ref.watch(sampleApiClientProvider);
  return SampleRepositoryImpl(apiClient: apiClient);
}

/// サンプルリポジトリのインターフェース
abstract interface class SampleRepository {
  /// ユーザー一覧を取得
  Future<List<User>> getUsers();

  /// 特定のユーザーを取得
  Future<User> getUser(int id);

  /// 投稿一覧を取得
  Future<List<Post>> getPosts({int? userId, int? limit, int? page});

  /// 特定の投稿を取得
  Future<Post> getPost(int id);

  /// 新規投稿を作成
  Future<Post> createPost(Post post);

  /// 投稿を更新
  Future<Post> updatePost(Post post);

  /// 投稿を削除
  Future<void> deletePost(int id);
}

/// SampleRepositoryの実装クラス
class SampleRepositoryImpl implements SampleRepository {
  SampleRepositoryImpl({required SampleApiClient apiClient})
    : _apiClient = apiClient;

  final SampleApiClient _apiClient;

  @override
  Future<List<User>> getUsers() async {
    return await _apiClient.getUsers();
  }

  @override
  Future<User> getUser(int id) async {
    return await _apiClient.getUser(id);
  }

  @override
  Future<List<Post>> getPosts({int? userId, int? limit, int? page}) async {
    return await _apiClient.getPosts(userId: userId, limit: limit, page: page);
  }

  @override
  Future<Post> getPost(int id) async {
    return await _apiClient.getPost(id);
  }

  @override
  Future<Post> createPost(Post post) async {
    return await _apiClient.createPost(post);
  }

  @override
  Future<Post> updatePost(Post post) async {
    return await _apiClient.updatePost(post.id, post);
  }

  @override
  Future<void> deletePost(int id) async {
    await _apiClient.deletePost(id);
  }
}
