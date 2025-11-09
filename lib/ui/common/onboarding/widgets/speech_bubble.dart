import 'package:flutter/material.dart';

class SpeechBubblePainter extends CustomPainter {
  final bool isSelected;
  final bool pointsRight;
  final Color fillColor;
  final Color borderColor;

  SpeechBubblePainter({
    required this.isSelected,
    required this.pointsRight,
    this.fillColor = Colors.white,
    this.borderColor = const Color(0xFF1E5A7D),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double bubbleRadius = size.width * 0.4;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2.2;
    final double tailWidth = 28;
    final double tailHeight = 22;

    final Paint fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final Paint borderPaint = Paint()
      ..color = isSelected ? borderColor : Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = isSelected ? 3.0 : 0.0
      ..isAntiAlias = true;

    final Path path = Path();

    // Main circular bubble
    path.addOval(Rect.fromCircle(center: Offset(centerX, centerY), radius: bubbleRadius));

    // Tail base position (slightly to the right or left of center)
    final double tailBaseY = centerY + bubbleRadius * 0.7;
    final double tailBaseX = pointsRight
        ? centerX + bubbleRadius * 0.4
        : centerX - bubbleRadius * 0.4;

    // Draw smooth curved tail
    final Path tailPath = Path();
    if (pointsRight) {
      tailPath.moveTo(tailBaseX - tailWidth / 2, tailBaseY);
      tailPath.quadraticBezierTo(
        tailBaseX,
        tailBaseY + tailHeight,
        tailBaseX + tailWidth / 2,
        tailBaseY - 2,
      );
    } else {
      tailPath.moveTo(tailBaseX + tailWidth / 2, tailBaseY);
      tailPath.quadraticBezierTo(
        tailBaseX,
        tailBaseY + tailHeight,
        tailBaseX - tailWidth / 2,
        tailBaseY - 2,
      );
    }

    path.addPath(tailPath, Offset.zero);

    // Draw bubble and border
    canvas.drawPath(path, fillPaint);
    if (isSelected) {
      canvas.drawPath(path, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant SpeechBubblePainter oldDelegate) {
    return oldDelegate.isSelected != isSelected ||
        oldDelegate.pointsRight != pointsRight ||
        oldDelegate.fillColor != fillColor ||
        oldDelegate.borderColor != borderColor;
  }
}
