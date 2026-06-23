import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_colors.dart';
import 'package:test_task/features/notifications/domain/entities/app_notification.dart';

abstract final class NotificationData {
  static const items = [
    AppNotification(
      title: 'Workout Reminder',
      message: 'Upper Body starts in 30 minutes.',
      timeLabel: '25m ago',
      icon: Icons.fitness_center,
      iconColor: AppColors.accentTeal,
      isUnread: true,
    ),
    AppNotification(
      title: 'Hydration Goal',
      message: '500 ml added to your water log.',
      timeLabel: '1h ago',
      icon: Icons.water_drop_outlined,
      iconColor: AppColors.accentBlue,
      isUnread: true,
    ),
    AppNotification(
      title: 'Weekly Progress',
      message: 'You completed 2 of 4 workouts this week.',
      timeLabel: 'Yesterday',
      icon: Icons.trending_up,
      iconColor: AppColors.accentGreen,
    ),
    AppNotification(
      title: 'Weight Update',
      message: 'Your weight increased by +1.6 kg.',
      timeLabel: '2 days ago',
      icon: Icons.monitor_weight_outlined,
      iconColor: AppColors.accentOrange,
    ),
  ];
}
