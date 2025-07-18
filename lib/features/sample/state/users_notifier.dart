import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:game_concierge/features/sample/model/user.dart';
import 'package:game_concierge/features/sample/usecase/users_usecase.dart';

part 'users_notifier.g.dart';

/// ユーザー一覧の状態管理
/// UI層はこのプロバイダーを監視してユーザー一覧を表示
@riverpod
class UsersNotifier extends _$UsersNotifier {
  @override
  Future<List<User>> build() async {
    // UseCaseを通してビジネスロジックを適用したユーザー一覧を取得
    final usersUseCase = ref.watch(usersUseCaseProvider);
    return await usersUseCase.getUsers();
  }

  /// ユーザー一覧を手動で更新
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final usersUseCase = ref.read(usersUseCaseProvider);
      return await usersUseCase.getUsers();
    });
  }
}
