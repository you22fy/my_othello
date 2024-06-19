import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/bottom_bar_provider.dart';

extension BottomBarItemExtension on BottomBarItem {
  String get label {
    switch (this) {
      case BottomBarItem.home:
        return 'ホーム';
      case BottomBarItem.match:
        return '対戦';
      case BottomBarItem.gacha:
        return 'ガチャ';
      case BottomBarItem.settings:
        return '設定';
    }
  }

  IconData get icon {
    switch (this) {
      case BottomBarItem.home:
        return Icons.home;
      case BottomBarItem.match:
        return Icons.gamepad;
      case BottomBarItem.gacha:
        return Icons.local_play_sharp;
      case BottomBarItem.settings:
        return Icons.settings;
    }
  }

  int get index {
    switch (this) {
      case BottomBarItem.home:
        return 0;
      case BottomBarItem.match:
        return 1;
      case BottomBarItem.gacha:
        return 2;
      case BottomBarItem.settings:
        return 3;
    }
  }

  String get route {
    switch (this) {
      case BottomBarItem.home:
        return '/';
      case BottomBarItem.match:
        return '/match';
      case BottomBarItem.gacha:
        return '/gacha';
      case BottomBarItem.settings:
        return '/settings';
    }
  }
}

class AppBottomNavigationBar extends HookConsumerWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bottomNavigationBarProvider);
    final controller = ref.read(bottomNavigationBarProvider.notifier);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.cyan,
      unselectedItemColor: Colors.grey,
      currentIndex: state.currentIndex,
      onTap: (index) {
        final item = BottomBarItem.values[index];
        controller.changeItem(item);
        context.go(item.route);
      },
      items: [
        for (final item in BottomBarItem.values)
          BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.label,
          ),
      ],
    );
  }
}
