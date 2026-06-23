import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_colors.dart';
import 'package:test_task/core/theme/app_dimensions.dart';
import 'package:test_task/core/theme/app_text_styles.dart';
import 'package:test_task/core/widgets/nav_icons.dart';

enum AppTab { nutrition, plan, mood, profile }

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
  });

  final AppTab currentTab;
  final ValueChanged<AppTab> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _NavItem(
                    label: 'Nutrition',
                    isActive: currentTab == AppTab.nutrition,
                    onTap: () => onTabSelected(AppTab.nutrition),
                    showIndicator: false,
                    iconBuilder: (color) => NutritionNavIcon(color: color),
                  ),
                  _NavItem(
                    label: 'Plan',
                    isActive: currentTab == AppTab.plan,
                    onTap: () => onTabSelected(AppTab.plan),
                    showIndicator: true,
                    iconBuilder: (color) => PlanNavIcon(color: color),
                  ),
                  _NavItem(
                    label: 'Mood',
                    isActive: currentTab == AppTab.mood,
                    onTap: () => onTabSelected(AppTab.mood),
                    showIndicator: true,
                    activeIndicatorColor: AppColors.accentPurple,
                    iconBuilder: (color) => MoodNavIcon(color: color),
                  ),
                  _NavItem(
                    label: 'Profile',
                    isActive: currentTab == AppTab.profile,
                    onTap: () => onTabSelected(AppTab.profile),
                    showIndicator: false,
                    iconBuilder: (color) => ProfileNavIcon(color: color),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: AppDimensions.homeIndicatorWidth,
              height: AppDimensions.homeIndicatorHeight,
              decoration: BoxDecoration(
                color: AppColors.textPrimary.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.isActive,
    required this.onTap,
    required this.iconBuilder,
    required this.showIndicator,
    this.activeIndicatorColor = AppColors.textPrimary,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final Widget Function(Color color) iconBuilder;
  final bool showIndicator;
  final Color activeIndicatorColor;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.textPrimary : AppColors.textMuted;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 76,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconBuilder(color),
            const SizedBox(height: 5),
            Text(
              label,
              style: AppTextStyles.navLabel.copyWith(
                color: isActive ? AppColors.textPrimary : AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 2,
              width: showIndicator && isActive ? 28 : 0,
              decoration: BoxDecoration(
                color: activeIndicatorColor,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
