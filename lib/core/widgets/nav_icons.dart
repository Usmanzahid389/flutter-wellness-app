import 'package:flutter/material.dart';

class NutritionNavIcon extends StatelessWidget {
  const NutritionNavIcon({super.key, required this.color, this.size = 26});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _NutritionIconPainter(color: color),
    );
  }
}

class PlanNavIcon extends StatelessWidget {
  const PlanNavIcon({super.key, required this.color, this.size = 26});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _PlanIconPainter(color: color),
    );
  }
}

class MoodNavIcon extends StatelessWidget {
  const MoodNavIcon({super.key, required this.color, this.size = 26});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _MoodIconPainter(color: color),
    );
  }
}

class ProfileNavIcon extends StatelessWidget {
  const ProfileNavIcon({super.key, required this.color, this.size = 26});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ProfileIconPainter(color: color),
    );
  }
}

class _NutritionIconPainter extends CustomPainter {
  _NutritionIconPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;

    final bowl = Path()
      ..moveTo(size.width * 0.15, size.height * 0.55)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.9, size.width * 0.85, size.height * 0.55)
      ..lineTo(size.width * 0.78, size.height * 0.42)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.28, size.width * 0.22, size.height * 0.42)
      ..close();
    canvas.drawPath(bowl, paint);

    canvas.drawLine(
      Offset(size.width * 0.72, size.height * 0.2),
      Offset(size.width * 0.88, size.height * 0.08),
      paint..strokeWidth = 1.4,
    );
  }

  @override
  bool shouldRepaint(covariant _NutritionIconPainter oldDelegate) =>
      oldDelegate.color != color;
}

class _PlanIconPainter extends CustomPainter {
  _PlanIconPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;

    final r = RRect.fromRectAndRadius(
      Rect.fromLTWH(size.width * 0.12, size.height * 0.18, size.width * 0.76, size.height * 0.7),
      const Radius.circular(3),
    );
    canvas.drawRRect(r, paint);

    canvas.drawLine(
      Offset(size.width * 0.12, size.height * 0.38),
      Offset(size.width * 0.88, size.height * 0.38),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.35, size.height * 0.18),
      Offset(size.width * 0.35, size.height * 0.88),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.58, size.height * 0.18),
      Offset(size.width * 0.58, size.height * 0.88),
      paint,
    );

    final check = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(size.width * 0.68, size.height * 0.55),
      Offset(size.width * 0.74, size.height * 0.62),
      check,
    );
    canvas.drawLine(
      Offset(size.width * 0.74, size.height * 0.62),
      Offset(size.width * 0.86, size.height * 0.46),
      check,
    );
  }

  @override
  bool shouldRepaint(covariant _PlanIconPainter oldDelegate) => oldDelegate.color != color;
}

class _MoodIconPainter extends CustomPainter {
  _MoodIconPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.52), size.width * 0.34, paint);

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width * 0.36, size.height * 0.46),
        width: 8,
        height: 6,
      ),
      0,
      3.14,
      false,
      paint..strokeWidth = 1.4,
    );
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width * 0.64, size.height * 0.46),
        width: 8,
        height: 6,
      ),
      0,
      3.14,
      false,
      paint,
    );

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.62),
        width: 14,
        height: 8,
      ),
      0.1,
      3.0,
      false,
      paint,
    );

    final star = Paint()..color = color..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.36, size.height * 0.44), 1.5, star);
    canvas.drawCircle(Offset(size.width * 0.64, size.height * 0.44), 1.5, star);
  }

  @override
  bool shouldRepaint(covariant _MoodIconPainter oldDelegate) => oldDelegate.color != color;
}

class _ProfileIconPainter extends CustomPainter {
  _ProfileIconPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.34), size.width * 0.16, paint);
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width * 0.5, size.height * 0.78),
        width: size.width * 0.55,
        height: size.height * 0.42,
      ),
      3.14,
      3.14,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _ProfileIconPainter oldDelegate) => oldDelegate.color != color;
}
