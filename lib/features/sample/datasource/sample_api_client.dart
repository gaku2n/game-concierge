import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:game_concierge/core/network/dio_client.dart';
import 'package:game_concierge/features/sample/model/post.dart';
import 'package:game_concierge/features/sample/model/user.dart';

part 'sample_api_client.g.dart';

/// SampleApiClientを提供するプロバイダー
@riverpod
SampleApiClient sampleApiClient(Ref ref) {
  final dio = ref.watch(dioClientProvider);
  return SampleApiClient(dio);
}

/// JSONPlaceholder APIクライアント（サンプル）
@RestApi()
abstract class SampleApiClient {
  factory SampleApiClient(Dio dio, {String? baseUrl}) = _SampleApiClient;

  /// ユーザー一覧を取得
  @GET('/users')
  Future<List<User>> getUsers();

  /// 特定のユーザーを取得
  @GET('/users/{id}')
  Future<User> getUser(@Path('id') int id);

  /// 投稿一覧を取得
  @GET('/posts')
  Future<List<Post>> getPosts({
    @Query('userId') int? userId,
    @Query('_limit') int? limit,
    @Query('_page') int? page,
  });

  /// 特定の投稿を取得
  @GET('/posts/{id}')
  Future<Post> getPost(@Path('id') int id);

  /// 新規投稿を作成
  @POST('/posts')
  Future<Post> createPost(@Body() Post post);

  /// 投稿を更新
  @PUT('/posts/{id}')
  Future<Post> updatePost(@Path('id') int id, @Body() Post post);

  /// 投稿を削除
  @DELETE('/posts/{id}')
  Future<void> deletePost(@Path('id') int id);
}
