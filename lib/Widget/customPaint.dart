import 'package:flutter/material.dart';

class ReversedGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Gradient background (reversed)
    const gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        // Violet at the top
        Colors.black,
        Colors.black,
        // Color(0xFF190033), // Black at the bottom
      ],
      stops: [0.4, 1.0], // Smooth gradient transition
    );

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    paint.shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);

    // Add blur effect to blend between colors
    final blurPaint = Paint()
      ..color = Colors.black.withOpacity(0.3) // Subtle blur
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30);
    canvas.drawRect(rect, blurPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
