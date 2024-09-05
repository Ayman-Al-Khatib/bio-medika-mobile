import 'package:auto_size_text/auto_size_text.dart';
import 'package:bio_medika/controllers/categories_controller.dart';
import 'package:bio_medika/core/constant/app_assets_png.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageSliverAppBarCategory extends StatelessWidget {
  const CustomImageSliverAppBarCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.find<CartegoriesControllerImp>();
    return SliverAppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: AppColor.background,
      backgroundColor: AppColor.background,
      elevation: AppConstants.val_0,
      pinned: true,
      centerTitle: true,
      stretch: true,
      expandedHeight: size.height * 0.3,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        //!
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.updateTitleOpacity(AppConstants.val_1 -
              (constraints.maxHeight - kToolbarHeight) /
                  (size.height * 0.3 - kToolbarHeight));
        });
        //!
        return FlexibleSpaceBar(
          stretchModes: const [
            StretchMode.zoomBackground,
          ],
          collapseMode: CollapseMode.parallax,
          background: const Image(
            fit: BoxFit.cover,
            image: AssetImage(AppAssetsPng.sliverCategories),
          ),
          centerTitle: true,
          expandedTitleScale: AppConstants.val_2,
          title: Obx(
            () => Opacity(
              opacity: controller.titleOpacity.value > 0.5
                  ? AppConstants.val_1
                  : controller.titleOpacity.value,
              child: AutoSizeText(
                maxLines: 1,
                AppTextsEnglish.Categories.tr,
                style: const TextStyle(
                    fontSize: AppConstants.val_28,
                    color: AppColor.backgroundExpired,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          titlePadding: const EdgeInsets.all(AppConstants.val_4),
        );
      }),
    );
  }
}
