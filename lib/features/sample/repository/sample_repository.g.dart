// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

/// SampleRepositoryを提供するプロバイダー
@ProviderFor(sampleRepository)
const sampleRepositoryProvider = SampleRepositoryProvider._();

/// SampleRepositoryを提供するプロバイダー
final class SampleRepositoryProvider
    extends
        $FunctionalProvider<
          SampleRepository,
          SampleRepository,
          SampleRepository
        >
    with $Provider<SampleRepository> {
  /// SampleRepositoryを提供するプロバイダー
  const SampleRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sampleRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sampleRepositoryHash();

  @$internal
  @override
  $ProviderElement<SampleRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SampleRepository create(Ref ref) {
    return sampleRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SampleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SampleRepository>(value),
    );
  }
}

String _$sampleRepositoryHash() => r'a29c0c76dce786ab7d3116f4dda2401bbe94ff5e';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
