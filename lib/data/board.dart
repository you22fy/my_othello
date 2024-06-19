import 'package:my_reversi_app/data/board_cell.dart';
import 'package:my_reversi_app/data/color.dart';

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
            cellColor: CellColor.none,
            piece: null,
          ),
        ),
      ),
    );
    // 初期の4つのコマを配置する
    board.board[2][2] = const BoardCell(
      col: 2,
      row: 2,
      cellColor: CellColor.white,
    );
    board.board[3][3] = const BoardCell(
      col: 3,
      row: 3,
      cellColor: CellColor.white,
    );
    board.board[2][3] = const BoardCell(
      col: 2,
      row: 3,
      cellColor: CellColor.black,
    );
    board.board[3][2] = const BoardCell(
      col: 3,
      row: 2,
      cellColor: CellColor.black,
    );
    return board;
  }

  // セルの情報を取得する
  BoardCell getCell(int row, int col) {
    return board[row][col];
  }

  bool available(int row, int col, CellColor color) {
    if (board[row][col].cellColor != CellColor.none) {
      return false;
    }

    // すべての方向をチェックして少なくとも一方向で裏返せるか確認
    for (int dRow = -1; dRow <= 1; dRow++) {
      for (int dCol = -1; dCol <= 1; dCol++) {
        if (dRow == 0 && dCol == 0) continue;
        if (canFlip(row, col, dRow, dCol, color)) {
          return true;
        }
      }
    }
    return false;
  }

  void putPiece(int row, int col, CellColor color) {
    board[row][col] = BoardCell(row: row, col: col, cellColor: color);
    _reversePieces(row, col, color);
  }

  void _reversePieces(int row, int col, CellColor color) {
    for (int dRow = -1; dRow <= 1; dRow++) {
      for (int dCol = -1; dCol <= 1; dCol++) {
        if (dRow == 0 && dCol == 0) continue;
        if (canFlip(row, col, dRow, dCol, color)) {
          int r = row + dRow;
          int c = col + dCol;
          while (board[r][c].cellColor != color) {
            board[r][c] = BoardCell(row: r, col: c, cellColor: color);
            r += dRow;
            c += dCol;
          }
        }
      }
    }
  }

  bool canFlip(int row, int col, int dRow, int dCol, CellColor color) {
    int r = row + dRow;
    int c = col + dCol;
    bool foundOpponent = false;

    while (inBounds(r, c)) {
      if (board[r][c].cellColor == CellColor.none) {
        return false; // 空のセルに到達した場合はfalse
      }
      if (board[r][c].cellColor == color) {
        return foundOpponent; // 自分の色に到達し、その前に敵の色があればtrue
      }
      foundOpponent = true; // 敵の色を見つけた
      r += dRow;
      c += dCol;
    }

    return false; // ボードの端に到達した場合はfalse
  }

  bool inBounds(int row, int col) {
    return row >= 0 && row < board.length && col >= 0 && col < board[0].length;
  }
}
