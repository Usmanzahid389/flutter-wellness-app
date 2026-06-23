import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_colors.dart';
import 'package:test_task/core/theme/app_dimensions.dart';
import 'package:test_task/core/theme/app_text_styles.dart';
import 'package:test_task/core/widgets/mobile_status_bar.dart';
import 'package:test_task/features/plan/data/plan_data.dart';
import 'package:test_task/features/plan/presentation/widgets/training_week_section.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.background,
      child: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: MobileStatusBar()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppDimensions.horizontalPadding,
                  4,
                  AppDimensions.horizontalPadding,
                  0,
                ),
                child: Row(
                  children: [
                    Text(
                      'Training Calendar',
                      style: AppTextStyles.displayLarge.copyWith(fontSize: 28),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Save',
                        style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: Divider(
                  color: AppColors.weekDividerPurple,
                  thickness: 1,
                  height: 1,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final week = PlanData.weeks[index];
                  return TrainingWeekSection(
                    week: week,
                    showTopDivider: index > 0,
                  );
                },
                childCount: PlanData.weeks.length,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
