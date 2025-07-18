// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flavor_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// 現在のFlavorを提供するプロバイダー
@ProviderFor(flavor)
const flavorProvider = FlavorProvider._();

/// 現在のFlavorを提供するプロバイダー
final class FlavorProvider extends $FunctionalProvider<Flavor, Flavor, Flavor>
    with $Provider<Flavor> {
  /// 現在のFlavorを提供するプロバイダー
  const FlavorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'flavorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$flavorHash();

  @$internal
  @override
  $ProviderElement<Flavor> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Flavor create(Ref ref) {
    return flavor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Flavor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Flavor>(value),
    );
  }
}

String _$flavorHash() => r'd6cd27d4baf903ec45604a6a2856730607677c9b';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
