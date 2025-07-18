// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// PostsUseCaseを提供するプロバイダー
@ProviderFor(postsUseCase)
const postsUseCaseProvider = PostsUseCaseProvider._();

/// PostsUseCaseを提供するプロバイダー
final class PostsUseCaseProvider
    extends $FunctionalProvider<PostsUseCase, PostsUseCase, PostsUseCase>
    with $Provider<PostsUseCase> {
  /// PostsUseCaseを提供するプロバイダー
  const PostsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postsUseCaseHash();

  @$internal
  @override
  $ProviderElement<PostsUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostsUseCase create(Ref ref) {
    return postsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostsUseCase>(value),
    );
  }
}

String _$postsUseCaseHash() => r'ef0b2ea041ba9f4c7c9b15bf6cb70f896c7a1189';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
