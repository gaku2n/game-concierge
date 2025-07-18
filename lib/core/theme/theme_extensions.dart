import 'package:flutter/material.dart';
import 'package:game_concierge/core/theme/app_colors.dart';

/// ThemeDataにカスタムテーマアクセスのためのエクステンション
extension ThemeExtensions on ThemeData {
  /// アプリケーションカラーにアクセス
  ///
  /// 使用例:
  /// ```dart
  /// final colors = Theme.of(context).appColors;
  /// ```
  AppColors get appColors {
    final extension = this.extension<AppColors>();
    if (extension == null) {
      throw StateError(
        'AppColors is not registered. '
        'Make sure to add it to your ThemeData.extensions.',
      );
    }
    return extension;
  }
}
