import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/screens/change_password_screen.dart';
import 'package:myapp/screens/dashboard_screen.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/profile_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (BuildContext context, GoRouterState state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (BuildContext context, GoRouterState state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/change-password',
        builder: (BuildContext context, GoRouterState state) => const ChangePasswordScreen(),
      ),
    ],
  );
}
