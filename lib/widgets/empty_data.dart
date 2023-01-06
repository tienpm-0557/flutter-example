import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmptyDataView extends HookConsumerWidget {
  final String? content;

  const EmptyDataView({super.key, this.content});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 200,
      child: Center(child: Text(content ?? 'No data to display!')),
    );
  }
}
