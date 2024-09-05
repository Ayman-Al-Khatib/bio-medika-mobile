import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:flutter/material.dart';

class SwitchBetweenLoginSignup extends StatelessWidget {
  const SwitchBetweenLoginSignup({
    super.key,
    required this.explan,
    required this.nameNewPage,
    this.onTap,
  });
  final String explan;
  final String nameNewPage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          explan,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: AppConstants.val_14,
            color: AppColor.iconAndTextGrey,
          ),
        ),
        InkWell(
            onTap: onTap,
            child: Text(
              nameNewPage,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: AppConstants.val_14,
                color: AppColor.secondary,
              ),
            )),
      ],
    );
  }
}
