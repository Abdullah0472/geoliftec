import 'dart:math';

import 'package:flutter/material.dart';

class ArcText extends StatelessWidget {
  final String text;
  final double radius;
  final double fontSize;
  final Color color;

  const ArcText({
    required this.text,
    required this.radius,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ArcTextPainter(
        text: text,
        radius: radius,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}

class _ArcTextPainter extends CustomPainter {
  final String text;
  final double radius;
  final double fontSize;
  final Color color;

  _ArcTextPainter({
    required this.text,
    required this.radius,
    required this.fontSize,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    final textStyle = TextStyle(
      color: color,
      fontSize: fontSize,
    );

    final textSpan = TextSpan(text: text, style: textStyle);

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout();

    final angle = pi / (text.length + 1);
    final centerX = size.width / 2;
    final centerY = radius + (textPainter.height / 2);

    for (int i = 0; i < text.length; i++) {
      final letter = text[i];
      final letterPainter = TextPainter(
        text: TextSpan(text: letter, style: textStyle),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout();

      final letterOffsetX =
          centerX - (letterPainter.width / 2) + (i + 1) * (letterPainter.width / 2) * sin(angle);
      final letterOffsetY = centerY - (i + 1) * (letterPainter.width / 2) * cos(angle);

      canvas.save();
      canvas.translate(letterOffsetX, letterOffsetY);
      canvas.rotate(-angle * (i + 1));

      letterPainter.paint(canvas, Offset.zero);

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ArcTextPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_ArcTextPainter oldDelegate) => false;
}
