import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_colors.dart';
import 'package:test_task/core/theme/app_dimensions.dart';
import 'package:test_task/core/theme/app_text_styles.dart';
import 'package:test_task/features/plan/domain/entities/training_schedule.dart';
import 'package:test_task/features/plan/presentation/widgets/workout_schedule_card.dart';

class TrainingWeekSection extends StatelessWidget {
  const TrainingWeekSection({
    super.key,
    required this.week,
    this.showTopDivider = false,
  });

  final TrainingWeek week;
  final bool showTopDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTopDivider && week.dividerColor != null) ...[
          const SizedBox(height: 4),
          Divider(color: week.dividerColor, thickness: 1, height: 1, indent: 16, endIndent: 16),
          const SizedBox(height: 14),
        ],
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.horizontalPadding),
          child: Row(
            children: [
              Text(week.label, style: AppTextStyles.titleMedium),
              const Spacer(),
              Text('Total: ${week.totalMinutes}min', style: AppTextStyles.caption),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppDimensions.horizontalPadding,
            2,
            AppDimensions.horizontalPadding,
            8,
          ),
          child: Text(week.dateRange, style: AppTextStyles.caption),
        ),
        if (week.days.isNotEmpty) ...week.days.map((day) => _DayRow(day: day)),
      ],
    );
  }
}

class _DayRow extends StatelessWidget {
  const _DayRow({required this.day});

  final TrainingDay day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.horizontalPadding),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 48,
              child: Padding(
                padding: const EdgeInsets.only(top: 14, bottom: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(day.dayLabel, style: AppTextStyles.caption),
                    const SizedBox(height: 2),
                    Text('${day.date}', style: AppTextStyles.titleMedium.copyWith(fontSize: 15)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: day.workout != null
                  ? WorkoutScheduleCard(workout: day.workout!)
                  : Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 1,
                        color: AppColors.borderSubtle,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
