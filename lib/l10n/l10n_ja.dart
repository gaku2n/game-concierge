// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get homeDescription => 'これはホーム画面です';

  @override
  String get homeTabLabel => 'ホーム';

  @override
  String get homeTitle => 'ホーム';

  @override
  String get homeWelcomeMessage => 'Welcome to TestApp';

  @override
  String get settingsPlaceholder => '設定画面のプレースホルダー';

  @override
  String get settingsTabLabel => '設定';

  @override
  String get settingsTitle => '設定';
}
