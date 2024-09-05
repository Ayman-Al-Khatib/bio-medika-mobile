import 'package:auto_size_text/auto_size_text.dart';
import 'package:bio_medika/controllers/tiny_tasks/up_price_awesom_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValueDisplay extends StatelessWidget {
  const ValueDisplay({
    super.key,
    required this.itemColor,
  });

  final Color itemColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerLeft,
      height: AppConstants.val_45,
      width: size.width * 0.28,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\$',
            style: TextStyle(
              fontSize: AppConstants.val_10,
              color: itemColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [
                  itemColor,
                  itemColor,
                ],
              ).createShader(bounds);
            },
            child: SizedBox(
              width: size.width * 0.28 - 8,
              child: GetBuilder<AwesomeControllerImp>(builder: (controller) {
                return AutoSizeText(
                  ((int.tryParse(controller.quantity.text) ?? 0) * 100)
                      .toString(),
                  maxLines: 1,
                  minFontSize: 8,
                  maxFontSize: 20,
                  style: const TextStyle(
                    height: 1.3,
                    fontSize: AppConstants.val_20,
                    color: AppColor.background,
                    fontWeight: FontWeight.w700,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
