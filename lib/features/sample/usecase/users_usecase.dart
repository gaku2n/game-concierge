import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:game_concierge/features/sample/repository/sample_repository.dart';
import 'package:game_concierge/features/sample/model/user.dart';

part 'users_usecase.g.dart';

/// UsersUseCaseを提供するプロバイダー
@riverpod
UsersUseCase usersUseCase(Ref ref) {
  final repository = ref.watch(sampleRepositoryProvider);
  return UsersUseCase(repository: repository);
}

/// ユーザー関連のビジネスロジック
class UsersUseCase {
  UsersUseCase({required SampleRepository repository})
    : _repository = repository;

  final SampleRepository _repository;

  /// ユーザー一覧を取得
  /// ビジネスルール: アクティブなユーザーのみを名前順でソート
  Future<List<User>> getUsers() async {
    final users = await _repository.getUsers();

    // ビジネスロジック: フィルタリングとソート
    return users
        .where((user) => user.email.isNotEmpty) // 有効なEmailを持つユーザーのみ
        .toList()
      ..sort((a, b) => a.name.compareTo(b.name)); // 名前順でソート
  }

  /// 特定のユーザーを取得
  /// ビジネスルール: 無効なユーザーIDの場合は例外をスロー
  Future<User> getUser(int id) async {
    if (id <= 0) {
      throw ArgumentError('User ID must be positive');
    }

    return await _repository.getUser(id);
  }
}