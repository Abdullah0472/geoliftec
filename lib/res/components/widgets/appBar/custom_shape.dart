import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Customshape extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double height = 450;
    double width = size.width;

    var path = Path();
    path.lineTo(0, 250-20);
    path.quadraticBezierTo(width/2, height-20, width, 250-20);
    // path.cubicTo(width/4, height+50, 3*width/4, height+50, width, 250-50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}