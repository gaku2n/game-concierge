import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:game_concierge/app.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}
