// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_tab_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(HomeTabNotifier)
const homeTabNotifierProvider = HomeTabNotifierProvider._();

final class HomeTabNotifierProvider
    extends $NotifierProvider<HomeTabNotifier, int> {
  const HomeTabNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeTabNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeTabNotifierHash();

  @$internal
  @override
  HomeTabNotifier create() => HomeTabNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$homeTabNotifierHash() => r'44c0aea28e3a0bbcc4ad004e48e324157642cbdd';

abstract class _$HomeTabNotifier extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
