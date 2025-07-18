import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_tab_notifier.g.dart';

@riverpod
class HomeTabNotifier extends _$HomeTabNotifier {
  @override
  int build() => 0; // 初期値: ホームタブ

  // ignore: use_setters_to_change_properties
  void selectTab(int index) => state = index;
}
