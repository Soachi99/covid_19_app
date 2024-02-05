import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Routes {
  // static const String rootRoute = '/';
}

final goRouterProvider = Provider<GoRouter>((ref) => router);

final router = GoRouter(initialLocation: '/', routes: <GoRoute>[
  // GoRoute(
  //     path: Routes.rootRoute,
  //     pageBuilder: (context, state) =>
  //         page(state: state, child: const Page())),
]);

page({required GoRouterState state, required Widget child}) =>
    NoTransitionPage<void>(key: state.pageKey, child: child);
