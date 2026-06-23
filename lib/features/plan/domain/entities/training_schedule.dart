import 'package:flutter/material.dart';

enum WorkoutCategory { arms, legs, other }

class ScheduledWorkout {
  const ScheduledWorkout({
    required this.title,
    required this.badgeLabel,
    required this.duration,
    required this.category,
  });

  final String title;
  final String badgeLabel;
  final String duration;
  final WorkoutCategory category;
}

class TrainingDay {
  const TrainingDay({
    required this.dayLabel,
    required this.date,
    this.workout,
  });

  final String dayLabel;
  final int date;
  final ScheduledWorkout? workout;
}

class TrainingWeek {
  const TrainingWeek({
    required this.label,
    required this.dateRange,
    required this.totalMinutes,
    required this.days,
    this.dividerColor,
  });

  final String label;
  final String dateRange;
  final int totalMinutes;
  final List<TrainingDay> days;
  final Color? dividerColor;
}
