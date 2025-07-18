import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:game_concierge/core/config/flavor.dart';

part 'flavor_provider.g.dart';

/// 現在のFlavorを提供するプロバイダー
@riverpod
Flavor flavor(Ref ref) {
  return Flavor.current;
}
