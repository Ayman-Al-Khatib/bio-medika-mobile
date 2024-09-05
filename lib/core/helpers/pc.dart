import 'dart:math';
import 'package:flutter/material.dart';

void pc(String text, {Color? color}) {
  color ??= getRandomColorFromList();
  String colorCode = color.toString().split('(0x')[1].split(')')[0];
  String formattedText =
      '\x1B[38;2;${Color(int.parse(colorCode, radix: 16)).red};'
      '${Color(int.parse(colorCode, radix: 16)).green};'
      '${Color(int.parse(colorCode, radix: 16)).blue}m$text\x1B[0m';
  debugPrint(formattedText);
}

generateRandomColor() {
  final random = Random();
  final red = random.nextInt(256);
  final green = random.nextInt(256);
  final blue = random.nextInt(256);
  const alpha = 255; // You can set the alpha channel as needed
  return Color.fromARGB(alpha, red, green, blue);
}

getRandomColorFromList() {
  final List<Color> colorList = [
    Colors.white,
    Colors.red,
    Colors.pink,
    Colors.deepOrange,
    const Color.fromARGB(255, 95, 3, 255),
    const Color.fromARGB(255, 0, 255, 132),
    const Color.fromARGB(255, 0, 255, 8),
  ];
  final random = Random();
  final int index = random.nextInt(colorList.length);
  return colorList[index];
}
