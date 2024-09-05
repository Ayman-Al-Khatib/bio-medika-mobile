import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/utils/loading_animation.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth(
      {super.key,
      required this.onTap,
      required this.text,
      this.loading = false});
  final Function onTap;
  final String text;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return loading ? const LoadingAnimation() : buttonWidget(size);
  }

  ElevatedButton buttonWidget(Size size) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
            borderRadius: AppBorderRadius.borderRadius_12),
        backgroundColor: AppColor.primary,
      ),
      clipBehavior: Clip.none,
      child: SizedBox(
        width: size.width - size.width * AppConstants.horizontalPadding * 3,
        height: size.height * 0.07,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColor.white,
              fontSize: AppConstants.val_20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
