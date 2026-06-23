import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_colors.dart';
import 'package:test_task/core/theme/app_dimensions.dart';
import 'package:test_task/core/theme/app_text_styles.dart';
import 'package:test_task/core/widgets/mobile_status_bar.dart';
import 'package:test_task/core/widgets/profile_avatar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.background,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const MobileStatusBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.horizontalPadding),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    const ProfileAvatar(size: 80),
                    const SizedBox(height: 16),
                    Text('Profile', style: AppTextStyles.headlineMedium),
                    const SizedBox(height: 8),
                    Text(
                      'Your account settings and preferences',
                      style: AppTextStyles.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    _ProfileTile(icon: Icons.person_outline, title: 'Personal Info'),
                    _ProfileTile(icon: Icons.fitness_center, title: 'Fitness Goals'),
                    _ProfileTile(icon: Icons.settings_outlined, title: 'Settings'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.cardRadiusSmall),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textSecondary, size: 22),
          const SizedBox(width: 12),
          Text(title, style: AppTextStyles.titleMedium),
          const Spacer(),
          const Icon(Icons.chevron_right, color: AppColors.textMuted, size: 20),
        ],
      ),
    );
  }
}
