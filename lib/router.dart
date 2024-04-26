import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchenwise/data/inventory_data.dart';
import 'package:kitchenwise/data/recipe_data.dart';
import 'package:kitchenwise/models/inventory_state.dart';
import 'package:kitchenwise/models/recipe_state.dart';
import 'package:kitchenwise/screens/auth/create_account_page.dart';
import 'package:kitchenwise/screens/auth/forgot_password.dart';
import 'package:kitchenwise/screens/auth/validation_code_page.dart';
import 'package:kitchenwise/screens/recipes/home_page.dart';
import 'package:kitchenwise/screens/inventory/inventory_page.dart';
import 'package:kitchenwise/screens/auth/landing_page.dart';
import 'package:kitchenwise/screens/auth/login_page.dart';
import 'package:kitchenwise/screens/profile/profile_page.dart';
import 'package:kitchenwise/screens/recipes/recipe_page.dart';
import 'package:kitchenwise/widgets/nav_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>();
final _shellNavigatorInventoryKey = GlobalKey<NavigatorState>();
final _shellNavigatorProfileKey = GlobalKey<NavigatorState>();

bool shouldLogin = false;

final router = GoRouter(
  initialLocation: shouldLogin ? '/' : '/home',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return RecipeState(
          data: recipeData,
          child: InventoryState(
              data: inventoryDataList,
              child: KitchenwiseNavBar(navigationShell: navigationShell)),
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorInventoryKey,
          routes: [
            GoRoute(
              path: '/inventory',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: InventoryPage(),
                );
              },
              routes: const [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: HomePage(),
                );
              },
              routes: [
                GoRoute(
                  name: 'recipe_page',
                  path: 'recipe_page',
                  builder: (context, state) => RecipePage(
                    id: state.uri.queryParameters['recipeId'],
                    imageUrl: state.uri.queryParameters['imageUrl'],
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfileKey,
          routes: [
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: ProfilePage(),
                );
              },
              routes: const [],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const LandingPage(),
      routes: [
        GoRoute(
          path: 'login',
          builder: (context, state) => const LoginPage(),
          routes: [
            GoRoute(
                path: 'forgot_password',
                builder: (context, state) => const ForgotPasswordPage(),
                routes: [
                  GoRoute(
                    path: 'validation_page',
                    builder: (context, state) => const ValidationCodePage(),
                  ),
                ]),
          ],
        ),
        GoRoute(
          path: 'create_account',
          builder: (context, state) => const CreateAccountPage(),
        ),
      ],
    ),
  ],
);
