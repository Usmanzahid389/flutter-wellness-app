import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_colors.dart';
import 'package:test_task/core/theme/app_dimensions.dart';
import 'package:test_task/core/theme/app_text_styles.dart';
import 'package:test_task/core/widgets/mobile_status_bar.dart';
import 'package:test_task/features/calendar/presentation/widgets/calendar_bottom_sheet.dart';
import 'package:test_task/features/notifications/presentation/widgets/notification_bottom_sheet.dart';
import 'package:test_task/features/nutrition/presentation/widgets/date_strip.dart';
import 'package:test_task/features/nutrition/presentation/widgets/insight_cards.dart';
import 'package:test_task/features/nutrition/presentation/widgets/week_selector.dart';
import 'package:test_task/features/nutrition/presentation/widgets/workout_card.dart';

class NutritionPage extends StatefulWidget {
  const NutritionPage({super.key});

  @override
  State<NutritionPage> createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  int _selectedDayIndex = 1;

  static const _weekDays = [
    DateStripDay(dayLabel: 'M', date: 21),
    DateStripDay(dayLabel: 'TU', date: 22, isSelected: true),
    DateStripDay(dayLabel: 'W', date: 23),
    DateStripDay(dayLabel: 'TH', date: 24),
    DateStripDay(dayLabel: 'F', date: 25),
    DateStripDay(dayLabel: 'SA', date: 26),
    DateStripDay(dayLabel: 'SU', date: 27),
  ];

  List<DateStripDay> get _days {
    return List.generate(_weekDays.length, (index) {
      final day = _weekDays[index];
      return DateStripDay(
        dayLabel: day.dayLabel,
        date: day.date,
        isSelected: index == _selectedDayIndex,
        statusDotColor: index == _selectedDayIndex ? AppColors.accentGreen : null,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    const padding = AppDimensions.horizontalPadding;

    return ColoredBox(
      color: AppColors.background,
      child: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: MobileStatusBar()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(padding, 4, padding, 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => NotificationBottomSheet.show(context),
                      behavior: HitTestBehavior.opaque,
                      child: const Icon(
                        Icons.notifications_none,
                        color: AppColors.textPrimary,
                        size: 24,
                      ),
                    ),
                    const Spacer(),
                    WeekSelector(
                      label: 'Week 1/4',
                      onTap: () => CalendarBottomSheet.show(context),
                    ),
                    const Spacer(),
                    const SizedBox(width: 24),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(padding, 22, padding, 0),
                child: GestureDetector(
                  onTap: () => CalendarBottomSheet.show(context),
                  child: Text(
                    'Today, 22 Dec 2024',
                    style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(padding, 18, padding, 0),
                child: DateStrip(
                  days: _days,
                  onDayTap: (index) => setState(() => _selectedDayIndex = index),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(padding, 26, padding, 10),
                child: Row(
                  children: [
                    Text('Workouts', style: AppTextStyles.headlineMedium),
                    const Spacer(),
                    const Icon(Icons.wb_sunny_outlined, size: 16, color: AppColors.textSecondary),
                    const SizedBox(width: 3),
                    Text('9°', style: AppTextStyles.caption),
                    const SizedBox(width: 10),
                    const Icon(Icons.nightlight_round, size: 16, color: AppColors.textSecondary),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding),
                child: const WorkoutCard(
                  subtitle: 'December 22 - 25m - 30m',
                  title: 'Upper Body',
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(padding, 26, padding, 10),
                child: Text('My Insights', style: AppTextStyles.headlineMedium),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding),
                child: const Row(
                  children: [
                    Expanded(child: CaloriesCard(consumed: 550, remaining: 1950, goal: 2500)),
                    SizedBox(width: 10),
                    Expanded(child: WeightCard(weightKg: 75, changeKg: 1.6)),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(padding, 10, padding, 16),
                child: const HydrationCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
