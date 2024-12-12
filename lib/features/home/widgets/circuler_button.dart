import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:trip_planner/common/color/app_color.dart';

class CircleScaleButton extends StatefulWidget {
  final VoidCallback? onTap;
  final IconData icon;
  const CircleScaleButton({super.key, required this.onTap, required this.icon});

  @override
  State<CircleScaleButton> createState() => _CircleScaleButtonState();
}

class _CircleScaleButtonState extends State<CircleScaleButton> {
  bool onPressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: onPressed ? .97 : 1,
      curve: Curves.bounceInOut,
      duration: const Duration(milliseconds: 50),
      child: GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            setState(() {
              onPressed = true;
            });
            Future.delayed(const Duration(milliseconds: 50)).then(
              (value) {
                setState(() {
                  onPressed = false;
                });
                widget.onTap!();
              },
            );
          }
        },
        onTapDown: (details) {
          setState(() {
            onPressed = true;
          });
        },
        onTapCancel: () {
          setState(() {
            onPressed = false;
          });
        },
        onTapUp: (details) {
          setState(() {
            onPressed = false;
          });
        },
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: !onPressed
                  ? Colors.transparent
                  : AppColor.cyan.withOpacity(0.3),
              blurRadius: 20,
              blurStyle: BlurStyle.outer,
              spreadRadius: 2,
            ),
          ], color: Colors.black.withOpacity(0.2), shape: BoxShape.circle),
          child: Center(
            child: HugeIcon(size: 28, icon: widget.icon, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
