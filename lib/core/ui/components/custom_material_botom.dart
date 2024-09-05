import 'package:bio_medika/core/constant/app_constant.dart';

import 'package:flutter/material.dart';

class CustomMaterialBottom extends StatelessWidget {
  const CustomMaterialBottom(
      {super.key,
      required this.width,
      required this.height,
      required this.padding,
      required this.borderRadius,
      required this.colorText,
      required this.color,
      required this.onPressed,
      required this.text});

  final double width;
  final double height;
  final double padding;
  final BorderRadiusGeometry borderRadius;
  final Color colorText;
  final Color color;
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius: borderRadius, color: color),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: padding),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: colorText,
              fontSize: AppConstants.val_16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
