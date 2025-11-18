import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double radius;
  final double gap;

  DottedBorderPainter({
    required this.color,
    this.strokeWidth = 1.5,
    this.radius = 20,
    this.gap = 6,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final rect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );

    final path = Path()..addRRect(rect);

    final metric = path.computeMetrics().first;
    double distance = 0.0;

    while (distance < metric.length) {
      final extractPath = metric.extractPath(distance, distance + gap);
      canvas.drawPath(extractPath, paint);
      distance += gap * 2;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
