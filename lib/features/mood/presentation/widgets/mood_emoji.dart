import 'package:flutter/material.dart';
import 'package:test_task/features/mood/domain/entities/mood_type.dart';

class MoodEmoji extends StatelessWidget {
  const MoodEmoji({super.key, required this.mood, this.size = 110});

  final MoodType mood;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _MoodEmojiPainter(mood: mood),
    );
  }
}

class _MoodEmojiPainter extends CustomPainter {
  _MoodEmojiPainter({required this.mood});

  final MoodType mood;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(size.width * 0.24),
    );

    final faceColor = switch (mood) {
      MoodType.happy => const Color(0xFFF5CBA0),
      MoodType.content => const Color(0xFFFFD93D),
      MoodType.peaceful => const Color(0xFFE8C4A0),
      MoodType.calm => const Color(0xFFFFB6C8),
    };

    canvas.drawRRect(rect, Paint()..color = faceColor);

    switch (mood) {
      case MoodType.happy:
        _drawHappyFace(canvas, size);
      case MoodType.content:
        _drawContentFace(canvas, size);
      case MoodType.peaceful:
        _drawPeacefulFace(canvas, size);
      case MoodType.calm:
        _drawCalmFace(canvas, size);
    }
  }

  void _drawHappyFace(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = const Color(0xFF2D5A3D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.8
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCenter(center: Offset(size.width * 0.32, size.height * 0.4), width: 16, height: 10),
      0, 3.14, false, stroke,
    );
    canvas.drawArc(
      Rect.fromCenter(center: Offset(size.width * 0.68, size.height * 0.4), width: 16, height: 10),
      0, 3.14, false, stroke,
    );
    canvas.drawArc(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.64), width: 42, height: 22),
      0.15, 2.8, false,
      stroke..strokeWidth = 3.2,
    );
  }

  void _drawContentFace(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = const Color(0xFF2D5A3D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCenter(center: Offset(size.width * 0.32, size.height * 0.38), width: 14, height: 9),
      0, 3.14, false, stroke,
    );
    canvas.drawArc(
      Rect.fromCenter(center: Offset(size.width * 0.68, size.height * 0.38), width: 14, height: 9),
      0, 3.14, false, stroke,
    );
    canvas.drawArc(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.66), width: 38, height: 26),
      0, 3.14, false,
      Paint()..color = const Color(0xFF2D5A3D)..style = PaintingStyle.fill,
    );
  }

  void _drawPeacefulFace(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF2D5A3D);
    canvas.drawCircle(Offset(size.width * 0.32, size.height * 0.44), 3.5, paint);
    canvas.drawCircle(Offset(size.width * 0.68, size.height * 0.44), 3.5, paint);
    canvas.drawArc(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.58), width: 30, height: 14),
      0.1, 3.0, false,
      Paint()
        ..color = const Color(0xFF2D5A3D)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.8
        ..strokeCap = StrokeCap.round,
    );
  }

  void _drawCalmFace(Canvas canvas, Size size) {
    final eyePaint = Paint()
      ..color = const Color(0xFFE879A9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCenter(center: Offset(size.width * 0.32, size.height * 0.4), width: 14, height: 9),
      3.14, 3.14, false, eyePaint,
    );
    canvas.drawArc(
      Rect.fromCenter(center: Offset(size.width * 0.68, size.height * 0.4), width: 14, height: 9),
      3.14, 3.14, false, eyePaint,
    );

    final cheekPaint = Paint()..color = const Color(0xFFFF8FAB).withValues(alpha: 0.55);
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.56), 9, cheekPaint);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.56), 9, cheekPaint);

    canvas.drawArc(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.63), width: 10, height: 6),
      0.2, 2.8, false,
      Paint()
        ..color = const Color(0xFFE879A9)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant _MoodEmojiPainter oldDelegate) =>
      oldDelegate.mood != mood;
}
