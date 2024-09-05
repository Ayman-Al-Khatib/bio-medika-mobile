import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/enum/type_widget.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../constant/app_constant.dart';

class ShimmerBioMedica extends StatelessWidget {
  final double width;
  final bool loading;
  final double height;
  final BorderRadiusGeometry borderRadius;
  final Widget child;
  final AlignmentGeometry? alignment;
  final TypeWidget typeWidget;
  final double space;
  final EdgeInsetsGeometry padding;

  const ShimmerBioMedica({
    super.key,
    required this.width,
    required this.loading,
    required this.height,
    required this.borderRadius,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.space = 0,
    this.alignment,
    this.typeWidget = TypeWidget.single,
  });

  @override
  Widget build(BuildContext context) {
    bool isArabic = Get.find<MyAppServices>().appIsArabic();
    if (loading) {
      return Shimmer.fromColors(
        baseColor: AppColor.background.withOpacity(0.6),
        highlightColor: AppColor.blue.withOpacity(0.4),
        child: Align(
            alignment: alignment ??
                (isArabic ? Alignment.centerRight : Alignment.centerLeft),
            child: getTypeWidget(isArabic)),
      );
    } else {
      return child;
    }
  }

  Widget getTypeWidget(bool isArabic) {
    switch (typeWidget) {
      case TypeWidget.row:
        return rowWidget(isArabic);
      case TypeWidget.column:
        return columnWidget();
      case TypeWidget.single:
        return singleWidget();
      case TypeWidget.grid:
        return gridWidget();
    }
  }

  Widget singleWidget() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[400]!,
        borderRadius: borderRadius,
      ),
    );
  }

  Widget rowWidget(bool isArabic) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        children: [
          for (int i = 0; i < 10; i++)
            Container(
              margin: EdgeInsets.only(
                  left: isArabic ? space : 0, right: isArabic ? 0 : space),
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey[400]!,
                borderRadius: borderRadius,
              ),
            ),
        ],
      ),
    );
  }

  Widget columnWidget() {
    return SingleChildScrollView(
      padding: padding,
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          for (int i = 0; i < 10; i++)
            Container(
              margin: EdgeInsets.only(bottom: space),
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey[400]!,
                borderRadius: borderRadius,
              ),
            ),
        ],
      ),
    );
  }

  Widget gridWidget() {
    final size = MediaQuery.of(Get.context!).size;
    return Padding(
      padding: const EdgeInsets.only(
          left: AppConstants.val_18,
          right: AppConstants.val_18,
          bottom: AppConstants.val_10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppConstants.val_20),
            width: size.width,
            height: AppConstants.val_60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.val_20),
              color: AppColor.background,
            ),
          ),
          const SizedBox(height: AppConstants.val_14),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(AppConstants.val_2),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppConstants.val_15,
                mainAxisSpacing: AppConstants.val_15,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppConstants.val_20),
                    color: AppColor.backgroundExpired,
                  ),
                );
              },
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}
