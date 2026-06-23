import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_colors.dart';
import 'package:test_task/core/theme/app_dimensions.dart';
import 'package:test_task/core/theme/app_text_styles.dart';

class CalendarBottomSheet extends StatefulWidget {
  const CalendarBottomSheet({
    super.key,
    this.initialMonth,
    this.selectedDay = 2,
    this.onDaySelected,
  });

  final DateTime? initialMonth;
  final int selectedDay;
  final ValueChanged<int>? onDaySelected;

  static Future<void> show(
    BuildContext context, {
    DateTime? initialMonth,
    int selectedDay = 2,
    ValueChanged<int>? onDaySelected,
  }) {
    final sheetHeight = MediaQuery.sizeOf(context).height * 0.52;

    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
        child: SizedBox(
          height: sheetHeight,
          child: CalendarBottomSheet(
            initialMonth: initialMonth,
            selectedDay: selectedDay,
            onDaySelected: onDaySelected,
          ),
        ),
      ),
    );
  }

  @override
  State<CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  late DateTime _displayMonth;
  late int _selectedDay;

  @override
  void initState() {
    super.initState();
    _displayMonth = widget.initialMonth ?? DateTime(2024, 9);
    _selectedDay = widget.selectedDay;
  }

  static const _monthNames = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  static const _weekdays = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

  void _previousMonth() {
    setState(() {
      _displayMonth = DateTime(_displayMonth.year, _displayMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _displayMonth = DateTime(_displayMonth.year, _displayMonth.month + 1);
    });
  }

  List<int?> _buildCalendarDays() {
    final firstDay = DateTime(_displayMonth.year, _displayMonth.month, 1);
    final daysInMonth = DateTime(_displayMonth.year, _displayMonth.month + 1, 0).day;
    final startWeekday = firstDay.weekday;

    final days = <int?>[];
    for (var i = 1; i < startWeekday; i++) {
      days.add(null);
    }
    for (var d = 1; d <= daysInMonth; d++) {
      days.add(d);
    }
    while (days.length % 7 != 0) {
      days.add(null);
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    final days = _buildCalendarDays();
    final monthLabel = '${_monthNames[_displayMonth.month - 1]} ${_displayMonth.year}';

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                IconButton(
                  onPressed: _previousMonth,
                  icon: const Icon(Icons.chevron_left, color: AppColors.textPrimary, size: 22),
                ),
                Expanded(
                  child: Text(
                    monthLabel,
                    style: AppTextStyles.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  onPressed: _nextMonth,
                  icon: const Icon(Icons.chevron_right, color: AppColors.textPrimary, size: 22),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: _weekdays
                  .map(
                    (d) => Expanded(
                      child: Text(
                        d,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.caption.copyWith(
                          fontSize: 10,
                          letterSpacing: 0.2,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 0,
                ),
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final day = days[index];
                  if (day == null) return const SizedBox.shrink();

                  final isSelected = day == _selectedDay;
                  return GestureDetector(
                    onTap: () {
                      setState(() => _selectedDay = day);
                      widget.onDaySelected?.call(day);
                    },
                    child: Center(
                      child: Container(
                        width: 36,
                        height: 36,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: isSelected
                              ? Border.all(color: AppColors.accentGreen, width: 2)
                              : null,
                        ),
                        child: Text(
                          '$day',
                          style: AppTextStyles.labelMedium.copyWith(
                            fontSize: 14,
                            color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              width: AppDimensions.homeIndicatorWidth,
              height: AppDimensions.homeIndicatorHeight,
              decoration: BoxDecoration(
                color: AppColors.textPrimary.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
