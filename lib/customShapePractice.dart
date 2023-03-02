import 'package:flutter/material.dart';

class customShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    // path.lineTo(0, height -50);
    // path.quadraticBezierTo(width /2, height , width , height -50);
    // path.lineTo(width , 0);
    path.lineTo(0, (height - 40));
    path.quadraticBezierTo(width /4, height -80, (width /2), height -40);
    path.quadraticBezierTo(width-(width /4), height , (width ), height -40);
   path.lineTo(width + 30, -50);
    //  size.height / 1.1,
    // const Radius.circular(30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}