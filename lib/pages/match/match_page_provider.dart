import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_reversi_app/data/color.dart';

import '../../data/board.dart';

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

  void putPiece(int row, int col) {
    final putColor = state.turn % 2 == 0 ? CellColor.white : CellColor.black;
    // final targetCellColor = state.board.getCell(row, col).cellColor;
    final available = state.board.available(row, col, putColor);
    print(available);
    if (available) {
      state.board.putPiece(row, col, putColor);
      state = state.copyWith(board: state.board);
      _processTurn();
    }
  }

  void _processTurn() {
    state = state.copyWith(turn: state.turn + 1);
  }
}

class MatchPageState {
  final Board board;
  final int turn;
  const MatchPageState({required this.board, required this.turn});

  factory MatchPageState.initial() {
    return MatchPageState(
      board: Board.initialize(),
      turn: 0,
    );
  }

  MatchPageState copyWith({
    Board? board,
    int? turn,
  }) {
    return MatchPageState(
      board: board ?? this.board,
      turn: turn ?? this.turn,
    );
  }
}
