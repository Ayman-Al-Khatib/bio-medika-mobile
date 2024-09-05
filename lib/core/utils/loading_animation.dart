import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingAnimation extends StatelessWidget {
  final double? height;
  const LoadingAnimation({super.key, this.height});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SpinKitThreeBounce(
      color: AppColor.primary,
      size: height ?? size.height * 0.07,
      duration: const Duration(seconds: 1),
    );
  }
}
