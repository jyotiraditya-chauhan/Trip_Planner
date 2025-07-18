import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  final double notchRadius;
  final double cornerRadius;

  TicketClipper({
    this.notchRadius = 20,
    this.cornerRadius = 25,
  });

  @override
  Path getClip(Size size) {
    Path path = Path();

    // Variables for readability
    double w = size.width;
    double h = size.height;

    // Start from top-left after the corner radius
    path.moveTo(cornerRadius, 0);

    // Top line to right corner
    path.lineTo(w - cornerRadius, 0);

    // Top-right corner
    path.arcToPoint(
      Offset(w, cornerRadius),
      radius: Radius.circular(cornerRadius),
      clockwise: true,
    );

    // Right side with notch
    path.lineTo(w, (h / 2) - notchRadius);
    path.arcToPoint(
      Offset(w, (h / 2) + notchRadius),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.lineTo(w, h - cornerRadius);

    // Bottom-right corner
    path.arcToPoint(
      Offset(w - cornerRadius, h),
      radius: Radius.circular(cornerRadius),
      clockwise: true,
    );

    // Bottom line to left corner
    path.lineTo(cornerRadius, h);

    // Bottom-left corner
    path.arcToPoint(
      Offset(0, h - cornerRadius),
      radius: Radius.circular(cornerRadius),
      clockwise: true,
    );

    // Left side with notch
    path.lineTo(0, (h / 2) + notchRadius);
    path.arcToPoint(
      Offset(0, (h / 2) - notchRadius),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.lineTo(0, cornerRadius);

    // Top-left corner
    path.arcToPoint(
      Offset(cornerRadius, 0),
      radius: Radius.circular(cornerRadius),
      clockwise: true,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
