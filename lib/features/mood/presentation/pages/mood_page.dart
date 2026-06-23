import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_colors.dart';
import 'package:test_task/core/theme/app_dimensions.dart';
import 'package:test_task/core/theme/app_text_styles.dart';
import 'package:test_task/core/widgets/mobile_status_bar.dart';
import 'package:test_task/features/mood/domain/entities/mood_type.dart';
import 'package:test_task/features/mood/presentation/widgets/mood_ring_selector.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  MoodType _selectedMood = MoodType.calm;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final ringSize = (screenWidth * 0.78).clamp(260.0, AppDimensions.moodRingSize);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.0, -1.0),
          radius: 1.4,
          colors: [AppColors.moodGlow, AppColors.background],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MobileStatusBar(),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimensions.horizontalPadding,
                8,
                AppDimensions.horizontalPadding,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mood', style: AppTextStyles.displayLarge),
                  const SizedBox(height: 10),
                  Text('Start your day', style: AppTextStyles.bodyMedium),
                  const SizedBox(height: 6),
                  Text(
                    'How are you feeling at the Moment?',
                    style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: SizedBox(
                      width: constraints.maxWidth,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: constraints.maxHeight),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          MoodRingSelector(
                            mood: _selectedMood,
                            size: ringSize,
                            onMoodChanged: (mood) => setState(() => _selectedMood = mood),
                          ),
                          const SizedBox(height: 28),
                          Text(
                            _selectedMood.label,
                            style: AppTextStyles.headlineMedium,
                            textAlign: TextAlign.center,
                          ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppDimensions.horizontalPadding,
                0,
                AppDimensions.horizontalPadding,
                12,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.textPrimary,
                    foregroundColor: AppColors.background,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.background,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
