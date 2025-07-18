// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// UsersUseCaseを提供するプロバイダー
@ProviderFor(usersUseCase)
const usersUseCaseProvider = UsersUseCaseProvider._();

/// UsersUseCaseを提供するプロバイダー
final class UsersUseCaseProvider
    extends $FunctionalProvider<UsersUseCase, UsersUseCase, UsersUseCase>
    with $Provider<UsersUseCase> {
  /// UsersUseCaseを提供するプロバイダー
  const UsersUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersUseCaseHash();

  @$internal
  @override
  $ProviderElement<UsersUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UsersUseCase create(Ref ref) {
    return usersUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UsersUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UsersUseCase>(value),
    );
  }
}

String _$usersUseCaseHash() => r'e379071eb07a5e170554a16835b93ffce9858af3';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
