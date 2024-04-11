import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchenwise/screens/auth/forgot_password.dart';
import 'package:kitchenwise/screens/home_page.dart';
import 'package:kitchenwise/screens/inventory_page.dart';
import 'package:kitchenwise/screens/auth/landing_page.dart';
import 'package:kitchenwise/screens/auth/login_page.dart';
import 'package:kitchenwise/screens/profile_page.dart';
import 'package:kitchenwise/widgets/nav_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>();
final _shellNavigatorInventoryKey = GlobalKey<NavigatorState>();
final _shellNavigatorProfileKey = GlobalKey<NavigatorState>();

bool shouldLogin = false;

final homePath = shouldLogin ? '/home' : '/';
final landingPath = shouldLogin ? '/' : '/landing';
const inventoryPath = '/inventory';
const profilePath = '/profile';

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return KitchenwiseNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorInventoryKey,
          routes: [
            GoRoute(
              path: inventoryPath,
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: Scaffold(
                    body: InventoryPage(),
                  ),
                );
              },
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: homePath,
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: Scaffold(
                    body: HomePage(),
                  ),
                );
              },
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfileKey,
          routes: [
            GoRoute(
              path: profilePath,
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: Scaffold(
                    body: ProfilePage(),
                  ),
                );
              },
              routes: [],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: landingPath,
      builder: (context, state) => const LandingPage(),
      routes: [
        GoRoute(
          path: 'login',
          builder: (context, state) => const LoginPage(isCreateAccount: false),
          routes: [
            GoRoute(
                path: 'forgot_password',
                builder: (context, state) => const ForgotPasswordPage(),
                routes: [
                  GoRoute(
                    path: 'validation_page',
                    builder: (context, state) => const ForgotPasswordPage(
                      isValidationCodePage: true,
                    ),
                  ),
                ]),
          ],
        ),
        GoRoute(
          path: 'create_account',
          builder: (context, state) => const LoginPage(
            isCreateAccount: true,
          ),
        ),
      ],
    ),
  ],
);
