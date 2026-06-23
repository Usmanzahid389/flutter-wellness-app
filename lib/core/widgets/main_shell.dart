import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task/core/theme/app_colors.dart';
import 'package:test_task/core/widgets/app_bottom_nav.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static AppTab tabFromIndex(int index) => AppTab.values[index];

  static int indexFromTab(AppTab tab) => tab.index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: navigationShell,
      bottomNavigationBar: AppBottomNav(
        currentTab: tabFromIndex(navigationShell.currentIndex),
        onTabSelected: (tab) {
          navigationShell.goBranch(
            indexFromTab(tab),
            initialLocation: indexFromTab(tab) == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
