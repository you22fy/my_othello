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
      builder: (context, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/match',
      name: 'match',
      builder: (context, state) {
        return const MatchPage();
      },
    ),
    GoRoute(
      path: '/gacha',
      name: 'gacha',
      builder: (context, state) {
        return const GachaPage();
      },
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) {
        return const SettingsPage();
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
