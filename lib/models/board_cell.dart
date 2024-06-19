import 'package:my_reversi_app/models/piece.dart';

class BoardCell {
  final int col;
  final int row;
  final Piece? piece;

  const BoardCell({
    required this.col,
    required this.row,
    this.piece,
  });
}
