//
//
// import 'dart:math';
// import 'package:flutter/material.dart';
//
//
// class AppBarPainter extends CustomPainter {
//   final String text;
//   final TextStyle textStyle;
//
//   AppBarPainter(this.text, {required this.textStyle})
//       : assert(text != null),
//         assert(textStyle != null);
//
//   @override
//   @override
//   void paint(Canvas canvas, Size size) {
//     double centerX = size.width / 2;
//     double radius = size.width / 2;
//     double angle = 3 * pi / 2; // starting angle at the bottom
//     double angleStep = pi / (text.length + 5);
//
//     canvas.save();
//
//     canvas.translate(centerX, 0);
//
//     for (int i = 0; i < text.length; i++) {
//       canvas.save();
//
//       canvas.rotate(angle);
//
//       TextSpan span = TextSpan(
//         style: textStyle,
//         text: text[i],
//       );
//
//       TextPainter tp = TextPainter(
//         text: span,
//         textAlign: TextAlign.center,
//         textDirection: TextDirection.rtl,
//       );
//
//       tp.layout();
//
//       double dx = -tp.width / 2 + (i - (text.length - 1) / 2) * tp.height * 0.05;
//       double dy = -radius;
//
//       tp.paint(canvas, Offset(dx, dy));
//
//       canvas.restore();
//
//       angle += angleStep;
//     }
//
//     canvas.restore();
//   }
//
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

import 'dart:math';
import 'package:flutter/material.dart';

class AppBarPainter extends CustomPainter {
  final String text;
  final TextStyle textStyle;
  final double spacing;

  AppBarPainter(this.text, {required this.textStyle, this.spacing = 0.1})
      : assert(text != null),
        assert(textStyle != null),
        assert(spacing >= 0 && spacing <= 1);

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double radius = size.width / 2;
    double angle = 3 * pi / 2; // starting angle at the bottom
    double angleStep = pi / (text.length +2);

    canvas.save();

    canvas.translate(centerX, 0);

    for (int i = 0; i < text.length; i++) {
      canvas.save();

      canvas.rotate(angle);

      TextSpan span = TextSpan(
        style: textStyle,
        text: text[i],
      );

      TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      );

      tp.layout();

      // double dx = -tp.width / 2;
      // double dy = -radius + tp.height / 2;
      double dx = -tp.width / 2 + (i - (text.length - 1) / 2) * tp.height * 0.05;
      double dy = -radius;
      tp.paint(canvas, Offset(dx, dy));

      canvas.restore();

      angle += angleStep - (angleStep * spacing);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

