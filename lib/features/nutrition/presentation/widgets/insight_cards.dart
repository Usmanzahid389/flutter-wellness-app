import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_colors.dart';
import 'package:test_task/core/theme/app_dimensions.dart';
import 'package:test_task/core/theme/app_text_styles.dart';

class CaloriesCard extends StatelessWidget {
  const CaloriesCard({
    super.key,
    required this.consumed,
    required this.remaining,
    required this.goal,
  });

  final int consumed;
  final int remaining;
  final int goal;

  @override
  Widget build(BuildContext context) {
    final progress = consumed / goal;

    return _InsightCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('$consumed', style: AppTextStyles.statLarge.copyWith(fontSize: 26)),
              const SizedBox(width: 4),
              Text('Calories', style: AppTextStyles.statUnit.copyWith(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 6),
          Text('$remaining Remaining', style: AppTextStyles.caption),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('0', style: AppTextStyles.caption),
              Text('$goal', style: AppTextStyles.caption),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: SizedBox(
              height: 5,
              child: Stack(
                children: [
                  Container(color: AppColors.surfaceElevated),
                  FractionallySizedBox(
                    widthFactor: progress.clamp(0.0, 1.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: AppColors.calorieProgressGradient),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WeightCard extends StatelessWidget {
  const WeightCard({
    super.key,
    required this.weightKg,
    required this.changeKg,
  });

  final double weightKg;
  final double changeKg;

  @override
  Widget build(BuildContext context) {
    final isPositive = changeKg >= 0;

    return _InsightCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                weightKg.toStringAsFixed(0),
                style: AppTextStyles.statLarge.copyWith(fontSize: 26),
              ),
              const SizedBox(width: 2),
              Text('kg', style: AppTextStyles.statUnit.copyWith(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              color: AppColors.accentGreen.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                    color: AppColors.accentGreen,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isPositive ? Icons.north_east : Icons.south_east,
                    size: 9,
                    color: AppColors.background,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '${isPositive ? '+' : ''}${changeKg.toStringAsFixed(1)}kg',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.accentGreen,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text('Weight', style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}

class HydrationCard extends StatelessWidget {
  const HydrationCard({
    super.key,
    this.percent = 0,
    this.loggedMl = 0,
    this.recentLogMl = 500,
  });

  final int percent;
  final int loggedMl;
  final int recentLogMl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 12, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$percent%',
                        style: AppTextStyles.statLarge.copyWith(
                          fontSize: 34,
                          color: AppColors.accentBlue,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Hydration',
                        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Log Now',
                        style: AppTextStyles.caption.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                _HydrationGauge(loggedMl: loggedMl),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 11),
            color: AppColors.hydrationBarBg,
            alignment: Alignment.center,
            child: Text(
              '$recentLogMl ml added to water log',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HydrationGauge extends StatelessWidget {
  const _HydrationGauge({required this.loggedMl});

  final int loggedMl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 96,
      child: CustomPaint(
        painter: _HydrationGaugePainter(loggedMl: loggedMl),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _HydrationGaugePainter extends CustomPainter {
  _HydrationGaugePainter({required this.loggedMl});

  final int loggedMl;

  @override
  void paint(Canvas canvas, Size size) {
    final trackPaint = Paint()
      ..color = AppColors.surfaceElevated
      ..strokeCap = StrokeCap.round;

    final trackLeft = size.width * 0.35;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(trackLeft, 4, 6, size.height - 8),
        const Radius.circular(3),
      ),
      trackPaint..style = PaintingStyle.fill,
    );

    final markerPaint = Paint()
      ..color = AppColors.accentBlue
      ..strokeWidth = 1.2;

    for (final fraction in [0.0, 0.5, 1.0]) {
      final y = 4 + (size.height - 8) * (1 - fraction);
      canvas.drawLine(Offset(trackLeft + 6, y), Offset(size.width - 4, y), markerPaint);
    }

    final labels = ['2 L', '1 L', '0 L'];
    for (var i = 0; i < labels.length; i++) {
      final y = 10 + (size.height - 20) * (i / 2);
      final builder = TextPainter(
        text: TextSpan(
          text: labels[i],
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 9),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      builder.paint(canvas, Offset(size.width - builder.width, y - builder.height / 2));
    }

    final mlPainter = TextPainter(
      text: TextSpan(
        text: '${loggedMl}ml',
        style: const TextStyle(color: AppColors.accentBlue, fontSize: 9),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    mlPainter.paint(canvas, Offset(size.width - mlPainter.width, size.height - 14));
  }

  @override
  bool shouldRepaint(covariant _HydrationGaugePainter oldDelegate) =>
      oldDelegate.loggedMl != loggedMl;
}

class _InsightCard extends StatelessWidget {
  const _InsightCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.insightCardHeight,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
      ),
      child: child,
    );
  }
}
