// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// ユーザー一覧の状態管理
/// UI層はこのプロバイダーを監視してユーザー一覧を表示
@ProviderFor(UsersNotifier)
const usersNotifierProvider = UsersNotifierProvider._();

/// ユーザー一覧の状態管理
/// UI層はこのプロバイダーを監視してユーザー一覧を表示
final class UsersNotifierProvider
    extends $AsyncNotifierProvider<UsersNotifier, List<User>> {
  /// ユーザー一覧の状態管理
  /// UI層はこのプロバイダーを監視してユーザー一覧を表示
  const UsersNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersNotifierHash();

  @$internal
  @override
  UsersNotifier create() => UsersNotifier();
}

String _$usersNotifierHash() => r'1660c1b6e91d98727d32735f338186d362386cd4';

abstract class _$UsersNotifier extends $AsyncNotifier<List<User>> {
  FutureOr<List<User>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<User>>, List<User>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<User>>, List<User>>,
              AsyncValue<List<User>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
