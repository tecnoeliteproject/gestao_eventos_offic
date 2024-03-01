import 'dart:math';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CustomCircularAvatar extends StatelessWidget {
  const CustomCircularAvatar({
    required this.caracter,
    super.key,
    this.color,
    this.backgroundColor,
    this.size = 50,
  });

  final double size;
  final Color? color;
  final Color? backgroundColor;
  final String caracter;

  @override
  Widget build(BuildContext context) {
    return GFAvatar(
      size: size,
      backgroundColor: backgroundColor,
      child: Text(
        caracter,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
