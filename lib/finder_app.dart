import 'package:finder/bachelors_favorites.dart';
import 'package:finder/custom_widgets/bachelor_details.dart';
import 'package:flutter/material.dart';

import 'package:finder/bachelors_master.dart';
import 'package:go_router/go_router.dart';

class FinderApp extends StatelessWidget {
  const FinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TP Finder',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

// Router
final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const BachelorsMaster();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'bachelor/:id',
          builder: (context, state) => BachelorDetails(
              bachelorId: int.parse(state.pathParameters['id']!)),
        ),
        GoRoute(
            path: 'favorites',
            builder: (BuildContext context, GoRouterState state) {
              return const BachelorsFavorites();
            })
      ])
]);
