import 'package:flutter/material.dart';


class CircularAvatar extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  final double radius;

  const CircularAvatar({
    Key? key,
    required this.backgroundColor,
    required this.child,
    this.radius = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: radius,
      child: child,
    );
  }

  }