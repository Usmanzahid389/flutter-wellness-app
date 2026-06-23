import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_colors.dart';
import 'package:test_task/core/theme/app_dimensions.dart';
import 'package:test_task/core/theme/app_text_styles.dart';

class DateStripDay {
  const DateStripDay({
    required this.dayLabel,
    required this.date,
    this.isSelected = false,
    this.statusDotColor,
  });

  final String dayLabel;
  final int date;
  final bool isSelected;
  final Color? statusDotColor;
}

class DateStrip extends StatelessWidget {
  const DateStrip({
    super.key,
    required this.days,
    this.onDayTap,
  });

  final List<DateStripDay> days;
  final ValueChanged<int>? onDayTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(days.length, (index) {
        final day = days[index];
        return GestureDetector(
          onTap: () => onDayTap?.call(index),
          child: SizedBox(
            width: 40,
            child: Column(
              children: [
                Text(
                  day.dayLabel,
                  style: AppTextStyles.dayLabel.copyWith(
                    color: day.isSelected ? AppColors.textPrimary : AppColors.textMuted,
                    fontWeight: day.isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: AppDimensions.dateCircleSize,
                  height: AppDimensions.dateCircleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: day.isSelected ? AppColors.accentGreen : AppColors.borderSubtle,
                      width: day.isSelected ? 2 : 1,
                    ),
                    color: day.isSelected ? Colors.transparent : AppColors.surface,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${day.date}',
                    style: AppTextStyles.labelMedium.copyWith(
                      fontSize: 14,
                      color: day.isSelected ? AppColors.textPrimary : AppColors.textSecondary,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: day.statusDotColor ??
                        (day.isSelected ? AppColors.accentGreen : Colors.transparent),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
