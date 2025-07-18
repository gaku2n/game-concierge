import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO: 要変更
class Error404Screen extends StatelessWidget {
  const Error404Screen({super.key, this.onGoHome});

  final VoidCallback? onGoHome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              const Text(
                'ページが見つかりません',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'お探しのページは存在しないか、移動した可能性があります。',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (onGoHome != null) {
                    onGoHome!();
                  } else {
                    context.go('/home');
                  }
                },
                child: const Text('ホームへ戻る'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
