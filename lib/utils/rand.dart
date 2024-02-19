import 'dart:math';
import 'package:flutter/material.dart';

class Rand {
  static Color getColor() {
    switch (Random().nextInt(6)) {
      case 0:
        return Colors.green.shade200;
      case 1:
        return Colors.red.shade200;
      case 2:
        return Colors.yellow.shade200;
      case 3:
        return Colors.blue.shade200;
      case 4:
        return Colors.orange.shade200;
      case 5:
        return Colors.pink.shade200;
    }
    return Colors.black;
  }
}
