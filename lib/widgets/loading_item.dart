import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadingItem extends HookConsumerWidget {
  const LoadingItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SizedBox(
      height: 50,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
