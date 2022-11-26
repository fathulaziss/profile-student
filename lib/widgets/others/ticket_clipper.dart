// ignore_for_file: cascade_invocations

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(25, 0);
    path.arcToPoint(const Offset(0, 25), radius: const Radius.circular(20));
    path.lineTo(0, size.height - 35);
    path.arcToPoint(Offset(25, size.height), radius: const Radius.circular(22));
    path.lineTo(size.width - 25, size.height);
    path.arcToPoint(
      Offset(size.width, size.height - 35),
      radius: const Radius.circular(22),
    );
    path.lineTo(size.width, 25.w);
    path.arcToPoint(
      Offset(size.width - 25.w, 0),
      radius: const Radius.circular(20),
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
