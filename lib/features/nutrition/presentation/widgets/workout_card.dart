import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_colors.dart';
import 'package:test_task/core/theme/app_dimensions.dart';
import 'package:test_task/core/theme/app_text_styles.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    super.key,
    required this.subtitle,
    required this.title,
    this.accentColor = AppColors.workoutBar,
    this.onTap,
  });

  final String subtitle;
  final String title;
  final Color accentColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 88,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Container(width: 3, color: accentColor),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 14, 12, 14),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(subtitle, style: AppTextStyles.caption),
                          const SizedBox(height: 4),
                          Text(title, style: AppTextStyles.titleLarge),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
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
