import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PieceDisplay extends HookConsumerWidget {
  const PieceDisplay({this.color, super.key});

  factory PieceDisplay.normal() {
    return const PieceDisplay();
  }

  final Color? color;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
