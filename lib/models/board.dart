import 'package:my_reversi_app/models/board_cell.dart';

class Board {
  final List<List<BoardCell>> board;

  const Board({
    required this.board,
  });

  // ゲーム初期化
  factory Board.initialize() {
    final board = Board(
      board: List.generate(
        6,
        (r) => List.generate(
          6,
          (c) => BoardCell(
            row: r,
            col: c,
            piece: null,
          ),
        ),
      ),
    );
    // 初期の4つのコマを配置する
    board.board[2][2] = const BoardCell(col: 2, row: 2);
    board.board[3][3] = const BoardCell(col: 3, row: 3);
    board.board[2][3] = const BoardCell(col: 2, row: 3);
    board.board[3][2] = const BoardCell(col: 3, row: 2);
    return board;
  }
}
