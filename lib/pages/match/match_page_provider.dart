import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/board.dart';

final matchPageProvider =
    StateNotifierProvider<MatchPageController, MatchPageState>(
  (ref) {
    return MatchPageController();
  },
);

class MatchPageController extends StateNotifier<MatchPageState> {
  MatchPageController()
      : super(
          MatchPageState.initial(),
        );

  void updateBoard(Board board) {
    state = state.copyWith(board: board);
  }
}

class MatchPageState {
  final Board board;
  const MatchPageState({
    required this.board,
  });

  factory MatchPageState.initial() {
    return MatchPageState(
      board: Board.initialize(),
    );
  }

  MatchPageState copyWith({
    Board? board,
  }) {
    return MatchPageState(
      board: board ?? this.board,
    );
  }
}
