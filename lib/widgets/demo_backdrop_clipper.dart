import 'package:flutter/material.dart';

class CustomBackDropLayout extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0006000, size.height * 0.0062000);
    path0.lineTo(size.width * 0.9972000, size.height * 0.0079714);
    path0.lineTo(size.width * 0.9991667, size.height * 0.7814286);
    path0.lineTo(size.width * 0.0041667, size.height * 0.5014286);
    path0.lineTo(size.width * 0.0006000, size.height * 0.0062000);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}