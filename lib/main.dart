import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/providers/auth_provider.dart';
import 'package:myapp/providers/dashboard_provider.dart';
import 'package:myapp/providers/profile_provider.dart';
import 'package:myapp/screens/change_password_screen.dart';
import 'package:myapp/screens/dashboard_screen.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/profile_screen.dart';
import 'package:myapp/screens/shell_screen.dart';
import 'package:myapp/utils/app_colors.dart';
import 'package:myapp/utils/app_styles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const LoginScreen(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              ShellScreen(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/dashboard',
                  builder: (context, state) => const DashboardScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                    path: '/profile',
                    builder: (context, state) => const ProfileScreen(),
                    routes: [
                      GoRoute(
                        path: 'change-password',
                        builder: (context, state) =>
                            const ChangePasswordScreen(),
                      ),
                    ]),
              ],
            ),
          ],
        ),
      ],
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: MaterialApp.router(
        title: 'HRMS App',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          textTheme: TextTheme(
            titleLarge: AppStyles.titleStyle,
            bodyMedium: AppStyles.bodyStyle,
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
