import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:test_task/core/theme/app_colors.dart';
import 'package:test_task/core/theme/app_dimensions.dart';
import 'package:test_task/features/mood/domain/entities/mood_type.dart';
import 'package:test_task/features/mood/presentation/widgets/mood_emoji.dart';

class MoodRingSelector extends StatefulWidget {
  const MoodRingSelector({
    super.key,
    required this.mood,
    required this.onMoodChanged,
    this.size = AppDimensions.moodRingSize,
  });

  final MoodType mood;
  final ValueChanged<MoodType> onMoodChanged;
  final double size;

  @override
  State<MoodRingSelector> createState() => _MoodRingSelectorState();
}

class _MoodRingSelectorState extends State<MoodRingSelector> {
  static const _moods = MoodType.values;
  late double _angle;

  @override
  void initState() {
    super.initState();
    _angle = _angleForMood(widget.mood);
  }

  @override
  void didUpdateWidget(covariant MoodRingSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.mood != widget.mood) {
      _angle = _angleForMood(widget.mood);
    }
  }

  double _angleForMood(MoodType mood) {
    final index = _moods.indexOf(mood);
    return (index / _moods.length) * 2 * math.pi - math.pi / 2;
  }

  MoodType _moodForAngle(double angle) {
    var normalized = (angle + math.pi / 2) % (2 * math.pi);
    if (normalized < 0) normalized += 2 * math.pi;
    final index = ((normalized / (2 * math.pi)) * _moods.length).round() % _moods.length;
    return _moods[index];
  }

  void _updateFromLocalPosition(Offset local) {
    final center = Offset(widget.size / 2, widget.size / 2);
    final delta = local - center;
    final distance = delta.distance;
    final outerRadius = widget.size / 2 - 6;
    final innerRadius = widget.size / 2 - 50;

    if (distance < innerRadius - 16 || distance > outerRadius + 16) return;

    final angle = math.atan2(delta.dy, delta.dx);
    final mood = _moodForAngle(angle);

    setState(() => _angle = _angleForMood(mood));
    widget.onMoodChanged(mood);
  }

  @override
  Widget build(BuildContext context) {
    final stroke = AppDimensions.moodRingStroke;
    final handleRadius = widget.size / 2 - stroke / 2 - 2;
    final handleSize = AppDimensions.moodHandleSize;
    final ringSize = widget.size;

    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: ringSize,
        height: ringSize,
        child: GestureDetector(
          onPanUpdate: (details) => _updateFromLocalPosition(details.localPosition),
          onTapDown: (details) => _updateFromLocalPosition(details.localPosition),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: ringSize,
                height: ringSize,
                child: CustomPaint(
                  painter: _MoodRingPainter(strokeWidth: stroke),
                ),
              ),
              MoodEmoji(mood: widget.mood, size: ringSize * 0.38),
              Transform.translate(
                offset: Offset(
                  handleRadius * math.cos(_angle),
                  handleRadius * math.sin(_angle),
                ),
                child: Container(
                  width: handleSize,
                  height: handleSize,
                  decoration: BoxDecoration(
                    color: AppColors.textPrimary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.35),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MoodRingPainter extends CustomPainter {
  _MoodRingPainter({required this.strokeWidth});

  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - strokeWidth / 2 - 4;

    final rect = Rect.fromCircle(center: center, radius: radius);
    final gradient = SweepGradient(
      colors: AppColors.moodRingGradient,
      transform: const GradientRotation(-math.pi / 2),
    );

    final ringPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, 0, 2 * math.pi, false, ringPaint);
  }

  @override
  bool shouldRepaint(covariant _MoodRingPainter oldDelegate) =>
      oldDelegate.strokeWidth != strokeWidth;
}
