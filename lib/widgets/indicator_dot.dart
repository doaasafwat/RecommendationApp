
import 'package:flutter/material.dart';

class IndicatorDot extends StatelessWidget {
  final bool isActive;

  IndicatorDot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 30 : 8,
      height: isActive ? 10 : 8,
      decoration: BoxDecoration(
        borderRadius: isActive ? BorderRadius.circular(6) : null,
        shape: isActive ? BoxShape.rectangle : BoxShape.circle,
        color: isActive ? const Color(0xffFF5521) : const Color(0xffFF7C21),
      ),
    );
  }
}