import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomNavigationBarProvider = StateNotifierProvider<
    AppBottomNavigationBarController, AppBottomNavigationBarState>(
  (ref) {
    return AppBottomNavigationBarController();
  },
);

enum BottomBarItem {
  home,
  match,
  gacha,
  settings,
}

class AppBottomNavigationBarController
    extends StateNotifier<AppBottomNavigationBarState> {
  AppBottomNavigationBarController()
      : super(
          AppBottomNavigationBarState.initial(),
        );

  void changeItem(BottomBarItem item) {
    state = state.copyWith(item: item, currentIndex: item.index);
  }
}

class AppBottomNavigationBarState {
  final BottomBarItem item;
  final int currentIndex;

  AppBottomNavigationBarState({
    required this.item,
    required this.currentIndex,
  });

  factory AppBottomNavigationBarState.initial() {
    return AppBottomNavigationBarState(
      item: BottomBarItem.home,
      currentIndex: 0,
    );
  }

  AppBottomNavigationBarState copyWith({
    BottomBarItem? item,
    int? currentIndex,
  }) {
    return AppBottomNavigationBarState(
      item: item ?? this.item,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
