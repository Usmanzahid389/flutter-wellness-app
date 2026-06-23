import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_colors.dart';
import 'package:test_task/core/theme/app_dimensions.dart';
import 'package:test_task/core/theme/app_text_styles.dart';
import 'package:test_task/features/plan/domain/entities/training_schedule.dart';

class WorkoutScheduleCard extends StatelessWidget {
  const WorkoutScheduleCard({
    super.key,
    required this.workout,
  });

  final ScheduledWorkout workout;

  Color get _badgeColor {
    return switch (workout.category) {
      WorkoutCategory.arms => AppColors.armsBadge,
      WorkoutCategory.legs => AppColors.legsBadge,
      WorkoutCategory.other => AppColors.textSecondary,
    };
  }

  Color get _badgeBg {
    return switch (workout.category) {
      WorkoutCategory.arms => AppColors.armsBadgeBg,
      WorkoutCategory.legs => AppColors.legsBadgeBg,
      WorkoutCategory.other => AppColors.surfaceElevated,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 6, bottom: 2),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(AppDimensions.cardRadiusSmall),
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(width: 3, color: AppColors.textPrimary),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 14),
              child: _DragHandle(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 14, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _WorkoutBadge(
                            label: workout.badgeLabel,
                            color: _badgeColor,
                            backgroundColor: _badgeBg,
                          ),
                          const SizedBox(height: 10),
                          Text(workout.title, style: AppTextStyles.titleMedium),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Text(
                        workout.duration,
                        style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary),
                      ),
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

class _DragHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (row) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.5),
          child: Row(
            children: List.generate(
              2,
              (_) => Container(
                width: 3,
                height: 3,
                margin: const EdgeInsets.symmetric(horizontal: 1.5),
                decoration: const BoxDecoration(
                  color: AppColors.textMuted,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _WorkoutBadge extends StatelessWidget {
  const _WorkoutBadge({
    required this.label,
    required this.color,
    required this.backgroundColor,
  });

  final String label;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.directions_run, size: 11, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
