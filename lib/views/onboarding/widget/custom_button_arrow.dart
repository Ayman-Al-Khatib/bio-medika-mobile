import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonArrow extends StatelessWidget {
  const ButtonArrow({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColor.primary,
      child: IconButton(
        color: AppColor.white,
        onPressed: onPressed,
        icon: Icon(icon),
      ),
    );
  }
}
