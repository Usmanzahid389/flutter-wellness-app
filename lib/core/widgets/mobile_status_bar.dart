import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_colors.dart';

/// Shows the decorative iOS status bar only on web previews.
/// On real mobile devices the system status bar is used instead.
class MobileStatusBar extends StatelessWidget {
  const MobileStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return const SizedBox.shrink();

    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 4, 24, 0),
      child: Row(
        children: [
          Text(
            '9:41',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
            ),
          ),
          Spacer(),
          Icon(Icons.signal_cellular_alt, color: AppColors.textPrimary, size: 16),
          SizedBox(width: 6),
          Icon(Icons.wifi, color: AppColors.textPrimary, size: 16),
          SizedBox(width: 6),
          Icon(Icons.battery_full, color: AppColors.textPrimary, size: 20),
        ],
      ),
    );
  }
}
