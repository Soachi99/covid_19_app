import 'package:covid_19_app/src/features/login/presentation/login/login_page.dart';
import 'package:covid_19_app/src/features/splash_screen/presentation/splash_screen/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String rootRoute = '/';
  static const String login = '/login';
}

final navigatorKeyProvider =
    Provider<GlobalKey<NavigatorState>>((ref) => GlobalKey<NavigatorState>());

final goRouterProvider = Provider<GoRouter>((ref) => GoRouter(
    navigatorKey: ref.watch(navigatorKeyProvider),
    initialLocation: '/',
    routes: routes));

final List<GoRoute> routes = [
  GoRoute(
      path: Routes.rootRoute,
      pageBuilder: (context, state) =>
          page(state: state, child: const SplashScreenPage())),
  GoRoute(
      path: Routes.login,
      pageBuilder: (context, state) =>
          page(state: state, child: const LoginPage())),
];

page({required GoRouterState state, required Widget child}) =>
    NoTransitionPage<void>(key: state.pageKey, child: child);
