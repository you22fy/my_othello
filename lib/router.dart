import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_reversi_app/pages/gacha/gacha_page.dart';
import 'package:my_reversi_app/pages/home/home_page.dart';
import 'package:my_reversi_app/pages/match/match_page.dart';
import 'package:my_reversi_app/pages/settings/settings_page.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const HomePage(),
        );
      },
    ),
    GoRoute(
      path: '/match',
      name: 'match',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const MatchPage(),
        );
      },
    ),
    GoRoute(
      path: '/gacha',
      name: 'gacha',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const GachaPage(),
        );
      },
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const SettingsPage(),
        );
      },
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
);
