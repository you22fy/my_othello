import 'package:my_reversi_app/data/color.dart';
import 'package:my_reversi_app/data/piece.dart';

class BoardCell {
  final int col;
  final int row;
  final Piece? piece;
  final CellColor cellColor;

  const BoardCell({
    required this.col,
    required this.row,
    required this.cellColor,
    this.piece,
  });
}
