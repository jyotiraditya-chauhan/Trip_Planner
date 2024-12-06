import 'package:flutter/material.dart';
import 'dart:math' as math;

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Base gradient with softer transitions
    final Rect rect = Offset.zero & size;
    const gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF101E24),
        Color(0xFF0A3D3D),
        Color(0xFF06524A),
      ],
      stops: [0.0, 0.4, 1.0], // Adjusted stops for smoother transition
    );
    final paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);

    // Multiple layered glow effects for better blending
    final center = Offset(size.width * 0.65, size.height * 0.6);
    final radius = size.width * 0.8; // Increased radius for wider glow

    // Base glow layer (very subtle)
    final baseGlowGradient = RadialGradient(
      colors: [
        const Color(0xFF0CD6B0).withOpacity(0.1),
        const Color(0xFF0CD6B0).withOpacity(0.05),
        Colors.transparent,
      ],
      stops: const [0.0, 0.5, 1.0],
    );

    final baseGlowPaint = Paint()
      ..shader = baseGlowGradient
          .createShader(Rect.fromCircle(center: center, radius: radius * 1.2))
      ..blendMode = BlendMode.plus;

    canvas.drawCircle(center, radius * 1.2, baseGlowPaint);

    // Middle glow layer
    final middleGlowGradient = RadialGradient(
      colors: [
        const Color(0xFF0CD6B0).withOpacity(0.15),
        const Color(0xFF0CD6B0).withOpacity(0.1),
        const Color(0xFF0CD6B0).withOpacity(0.05),
        Colors.transparent,
      ],
      stops: const [0.0, 0.3, 0.6, 1.0],
    );

    final middleGlowPaint = Paint()
      ..shader = middleGlowGradient
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..blendMode = BlendMode.screen;

    canvas.drawCircle(center, radius, middleGlowPaint);

    // Core glow layer
    final coreGlowGradient = RadialGradient(
      colors: [
        const Color(0xFF0CD6B0).withOpacity(0.2),
        const Color(0xFF0CD6B0).withOpacity(0.15),
        const Color(0xFF0CD6B0).withOpacity(0.1),
        Colors.transparent,
      ],
      stops: const [0.0, 0.2, 0.4, 1.0],
    );

    final coreGlowPaint = Paint()
      ..shader = coreGlowGradient
          .createShader(Rect.fromCircle(center: center, radius: radius * 0.7))
      ..blendMode = BlendMode.screen;

    canvas.drawCircle(center, radius * 0.7, coreGlowPaint);

    // Intense center glow
    final centerGlowGradient = RadialGradient(
      colors: [
        const Color(0xFF0CD6B0).withOpacity(0.3),
        const Color(0xFF0CD6B0).withOpacity(0.2),
        const Color(0xFF0CD6B0).withOpacity(0.1),
        Colors.transparent,
      ],
      stops: const [0.0, 0.2, 0.4, 1.0],
    );

    final centerGlowPaint = Paint()
      ..shader = centerGlowGradient
          .createShader(Rect.fromCircle(center: center, radius: radius * 0.4))
      ..blendMode = BlendMode.screen;

    canvas.drawCircle(center, radius * 0.4, centerGlowPaint);

    // Subtle noise texture
    final noisePaint = Paint()
      ..color = Colors.white.withOpacity(0.005)
      ..blendMode = BlendMode.screen;

    final random = math.Random(42);
    for (int i = 0; i < 300; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(x, y), 0.3, noisePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
