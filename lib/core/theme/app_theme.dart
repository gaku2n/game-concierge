import 'package:flutter/material.dart';
import 'package:game_concierge/core/theme/app_colors.dart';

/// アプリケーションのテーマを統合管理するクラス
class AppTheme {
  AppTheme._();

  /// ライトテーマの生成
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
      extensions: <ThemeExtension<dynamic>>[AppColors.light()],
    );
  }

  /// ダークテーマの生成
  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      ),
      extensions: <ThemeExtension<dynamic>>[AppColors.dark()],
    );
  }
}
