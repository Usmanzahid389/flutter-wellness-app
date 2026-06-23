import 'package:flutter/material.dart';

class AppNotification {
  const AppNotification({
    required this.title,
    required this.message,
    required this.timeLabel,
    required this.icon,
    this.iconColor = const Color(0xFF2DD4BF),
    this.isUnread = false,
  });

  final String title;
  final String message;
  final String timeLabel;
  final IconData icon;
  final Color iconColor;
  final bool isUnread;
}
