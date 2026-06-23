import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task/core/widgets/main_shell.dart';
import 'package:test_task/features/mood/presentation/pages/mood_page.dart';
import 'package:test_task/features/nutrition/presentation/pages/nutrition_page.dart';
import 'package:test_task/features/plan/presentation/pages/plan_page.dart';
import 'package:test_task/features/profile/presentation/pages/profile_page.dart';

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/nutrition',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/nutrition',
                builder: (context, state) => const NutritionPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/plan',
                builder: (context, state) => const PlanPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/mood',
                builder: (context, state) => const MoodPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Route not found: ${state.uri}')),
    ),
  );
}
