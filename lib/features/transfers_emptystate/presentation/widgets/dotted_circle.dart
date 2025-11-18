import 'package:flutter/material.dart';

class DottedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DottedCirclePainter({
    required this.color,
    this.strokeWidth = 1.5,
    this.gap = 6,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final radius = size.width / 2;
    final path = Path()
      ..addOval(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      );

    final metric = path.computeMetrics().first;
    double distance = 0;

    while (distance < metric.length) {
      final extract = metric.extractPath(distance, distance + gap);
      canvas.drawPath(extract, paint);
      distance += gap * 2;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
