import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowImageSvg extends StatelessWidget {
  const ShowImageSvg({
    super.key,
    required this.path,
    this.color,
    this.width,
    this.height,
    this.isNeedColor = true,
  });
  final String path;
  final Color? color;
  final double? width;
  final double? height;
  final bool isNeedColor;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      fit: BoxFit.cover,
      path,
      height: height ?? 28,
      width: width ?? 28,
      colorFilter: isNeedColor
          ? ColorFilter.mode(
              color ?? AppColor.navigationBarIcon,
              BlendMode.srcIn,
            )
          : null,
    );
  }
}
