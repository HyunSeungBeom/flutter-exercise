import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
          path: "/",
          builder: (_, state) => HomeScreen(),
          routes: [GoRoute(path: "one", builder: (_, state) => OneScreen())]),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
