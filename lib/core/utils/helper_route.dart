import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_sign_in/presentation/screens/auth/login_screen.dart';

import '../../presentation/screens/home/widget/home_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
  ],
);
