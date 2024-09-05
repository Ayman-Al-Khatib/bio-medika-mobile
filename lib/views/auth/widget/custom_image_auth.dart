import 'package:flutter/material.dart';

class CustonImageAuth extends StatelessWidget {
  const CustonImageAuth({super.key, required this.imagePath, this.height});
  final String imagePath;
  final double? height;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Image.asset(imagePath, height: height ?? size.width * 0.6);
  }
}
