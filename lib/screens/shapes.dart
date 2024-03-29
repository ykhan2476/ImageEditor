import 'dart:ui';

import 'package:flutter/material.dart';

class heart extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final path = Path();
    path.quadraticBezierTo( 0, 0, 0,size.height/2);
    path.lineTo(size.width/2, size.height);
    Path().lineTo(size.width, size.height/2);
    path.quadraticBezierTo(size.width, 0, size.width, 0);
    path.quadraticBezierTo( size.width/2, size.height/4, size.width/2, size.height/4);
    path.quadraticBezierTo( size.width/2, size.height/4, 0,0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; 
  }
}
class circle extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
   final path = Path();
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = centerX < centerY ? centerX : centerY;
    path.addOval(Rect.fromCircle(center: Offset(centerX, centerY), radius: radius));
    return path; 
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; 
  }
}
class square extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
     final path = Path();
    path.lineTo(0, size.width); // Bottom-left
    path.lineTo(size.width, size.width); // Bottom-right
    path.lineTo(size.width, 0); // Top-right
    path.lineTo(0, 0); // Top-left
    path.close(); // Connects back to the start
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; 
  }
}
class rectangle extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
   final path = Path();
    path.lineTo(0, size.width/1.5); // Bottom-left
    path.lineTo(size.width, size.width/1.5); // Bottom-right
    path.lineTo(size.width, 0); // Top-right
    path.close(); // Connects back to the start
    return path; 
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; 
  }
}