import 'package:bio_medika/core/constant/app_assets_svg.dart';
import 'package:bio_medika/core/utils/show_image_svg.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key, this.imagePath = AppAssetsSvg.background});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: ShowImageSvg(
        path: imagePath,
        isNeedColor: false,
      ),
    );
  }
}
