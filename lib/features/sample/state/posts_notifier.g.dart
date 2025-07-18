// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// 投稿一覧の状態管理
/// UI層はこのプロバイダーを監視して投稿一覧を表示
@ProviderFor(PostsNotifier)
const postsNotifierProvider = PostsNotifierProvider._();

/// 投稿一覧の状態管理
/// UI層はこのプロバイダーを監視して投稿一覧を表示
final class PostsNotifierProvider
    extends $AsyncNotifierProvider<PostsNotifier, List<Post>> {
  /// 投稿一覧の状態管理
  /// UI層はこのプロバイダーを監視して投稿一覧を表示
  const PostsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postsNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postsNotifierHash();

  @$internal
  @override
  PostsNotifier create() => PostsNotifier();
}

String _$postsNotifierHash() => r'b9578818eda49c8e30271143b6608f4e0cafe50b';

abstract class _$PostsNotifier extends $AsyncNotifier<List<Post>> {
  FutureOr<List<Post>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Post>>, List<Post>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Post>>, List<Post>>,
              AsyncValue<List<Post>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
