import 'package:covid_19_app/src/features/home/presentation/details/details_page.dart';
import 'package:covid_19_app/src/features/home/presentation/home/home_page.dart';
import 'package:covid_19_app/src/features/login/presentation/login/login_page.dart';
import 'package:covid_19_app/src/features/splash_screen/presentation/splash_screen/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String rootRoute = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String details = '/details';
}

final navigatorKeyProvider =
    Provider<GlobalKey<NavigatorState>>((ref) => GlobalKey<NavigatorState>());

final goRouterProvider = Provider<GoRouter>((ref) => GoRouter(
    navigatorKey: ref.watch(navigatorKeyProvider),
    initialLocation: Routes.rootRoute,
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
  GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) =>
          page(state: state, child: const HomePage())),
  GoRoute(
      path: Routes.details,
      pageBuilder: (context, state) =>
          page(state: state, child: const DetailsPage())),
];

page({required GoRouterState state, required Widget child}) =>
    NoTransitionPage<void>(key: state.pageKey, child: child);
