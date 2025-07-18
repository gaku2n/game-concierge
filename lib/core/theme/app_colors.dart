import 'package:flutter/material.dart';

// TODO: 要変更
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors._({
    required this.brandPrimary,
    required this.brandSecondary,
    required this.success,
    required this.warning,
    required this.error,
  });

  // ライトテーマ用ファクトリー
  factory AppColors.light() {
    return const AppColors._(
      brandPrimary: Color(0xFF6750A4),
      brandSecondary: Color(0xFF625B71),
      success: Color(0xFF4CAF50),
      warning: Color(0xFFFF9800),
      error: Color(0xFFF44336),
    );
  }

  // ダークテーマ用ファクトリー
  factory AppColors.dark() {
    return const AppColors._(
      brandPrimary: Color(0xFFD0BCFF),
      brandSecondary: Color(0xFFCCC2DC),
      success: Color(0xFF81C784),
      warning: Color(0xFFFFB74D),
      error: Color(0xFFE57373),
    );
  }

  final Color brandPrimary;
  final Color brandSecondary;
  final Color success;
  final Color warning;
  final Color error;

  @override
  AppColors copyWith({
    Color? brandPrimary,
    Color? brandSecondary,
    Color? success,
    Color? warning,
    Color? error,
  }) {
    return AppColors._(
      brandPrimary: brandPrimary ?? this.brandPrimary,
      brandSecondary: brandSecondary ?? this.brandSecondary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    // 同じインスタンスの場合は最適化
    if (identical(this, other)) {
      return this;
    }

    return AppColors._(
      brandPrimary: Color.lerp(brandPrimary, other.brandPrimary, t)!,
      brandSecondary: Color.lerp(brandSecondary, other.brandSecondary, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppColors &&
          runtimeType == other.runtimeType &&
          brandPrimary == other.brandPrimary &&
          brandSecondary == other.brandSecondary &&
          success == other.success &&
          warning == other.warning &&
          error == other.error;

  @override
  int get hashCode =>
      Object.hash(brandPrimary, brandSecondary, success, warning, error);
}
