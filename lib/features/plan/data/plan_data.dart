import 'package:test_task/core/theme/app_colors.dart';
import 'package:test_task/features/plan/domain/entities/training_schedule.dart';

abstract final class PlanData {
  static const weeks = [
    TrainingWeek(
      label: 'Week 2/8',
      dateRange: 'December 8-14',
      totalMinutes: 60,
      dividerColor: AppColors.weekDividerPurple,
      days: [
        TrainingDay(
          dayLabel: 'Mon',
          date: 8,
          workout: ScheduledWorkout(
            title: 'Arm Blaster',
            badgeLabel: 'Arms Workout',
            duration: '25m - 30m',
            category: WorkoutCategory.arms,
          ),
        ),
        TrainingDay(dayLabel: 'Tue', date: 9),
        TrainingDay(dayLabel: 'Wed', date: 10),
        TrainingDay(
          dayLabel: 'Thu',
          date: 11,
          workout: ScheduledWorkout(
            title: 'Leg Day Blitz',
            badgeLabel: 'Leg Workout',
            duration: '25m - 30m',
            category: WorkoutCategory.legs,
          ),
        ),
        TrainingDay(dayLabel: 'Fri', date: 12),
        TrainingDay(dayLabel: 'Sat', date: 13),
        TrainingDay(dayLabel: 'Sun', date: 14),
      ],
    ),
    TrainingWeek(
      label: 'Week 2',
      dateRange: 'December 14-22',
      totalMinutes: 60,
      dividerColor: AppColors.weekDividerTeal,
      days: [],
    ),
  ];
}
