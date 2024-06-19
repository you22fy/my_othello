import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_reversi_app/components/app_bottom_bar.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(child: Text('${item.row}, ${item.col}')),
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
