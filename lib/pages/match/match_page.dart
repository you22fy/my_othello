import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_reversi_app/components/app_bottom_bar.dart';
import 'package:my_reversi_app/components/piece.dart';

import '../../data/color.dart';
import 'match_page_provider.dart';

class MatchPage extends HookConsumerWidget {
  const MatchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(matchPageProvider);
    final notifier = ref.watch(matchPageProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '俺のオセロニア',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.height * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
            ),
            itemCount: 36,
            itemBuilder: (context, index) {
              final row = index ~/ 6;
              final col = index % 6;
              final item = state.board.board[row][col];
              return GridTile(
                child: GestureDetector(
                  onTap: () {
                    notifier.putPiece(row, col);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: PieceDisplay(
                        color: item.cellColor == CellColor.black
                            ? Colors.black
                            : item.cellColor == CellColor.white
                                ? Colors.white
                                : null,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
