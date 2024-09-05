import 'package:bio_medika/controllers/expired_controller.dart';
import 'package:bio_medika/core/constant/app_assets_svg.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/helpers/get_name.dart';
import 'package:bio_medika/core/ui/shared/button_add_to_cart_awesom/custom_awesome_add_to_cart.dart';
import 'package:bio_medika/core/utils/show_image_svg.dart';
import 'package:bio_medika/models/medication_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class CustomExpiredItem extends GetView<ExpiredControllerImp> {
  const CustomExpiredItem({
    required this.medicationModel,
    super.key,
  });
  final MedicationModel medicationModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double widthItem = (size.width -
            AppConstants.val_15 -
            AppConstants.val_18 * AppConstants.val_2) /
        AppConstants.val_2;
    double heightItem = widthItem / 8 * 10;

    return InkWell(
      splashColor: AppColor.noColor,
      onTap: () {
        controller.goToDrugsDetails(medicationModel, medicationModel.imageUrl);
      },
      child: Container(
          width: widthItem,
          height: heightItem,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.val_20),
            // color: AppColor.primary.withOpacity(0.2)main,
            color: controller.infoDes.$1,
          ),
          child: Column(
            children: [
              const Spacer(),

              SizedBox(height: heightItem * 0.04),
              Hero(
                tag: medicationModel.imageUrl,
                child: CachedNetworkImage(
                  height: heightItem * 0.4,
                  width: widthItem * 0.8,
                  imageUrl: medicationModel.imageUrl,
                  placeholder: (context, url) => SizedBox(
                      height: heightItem * 0.4,
                      width: heightItem * 0.4,
                      child: const CircleAvatar(
                        backgroundColor: AppColor.noColor,
                        child: CircularProgressIndicator(),
                      )),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: AppConstants.val_28,
                  ),
                ),
              ),

              SizedBox(height: heightItem * 0.03),

              Text(
                getTextLang(
                    nameEnglish: medicationModel.commercialNameEn,
                    nameArabic: medicationModel.commercialNameAr),
                style: TextStyle(
                    color: controller.infoDes.$2,
                    fontSize: AppConstants.val_14,
                    height: AppConstants.val_1,
                    fontWeight: FontWeight.w700),
              ),

              Padding(
                padding: EdgeInsets.only(
                    left: AppConstants.val_24,
                    right: AppConstants.val_22,
                    top: heightItem * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: medicationModel.sale != 0 ||
                              medicationModel.dailySale != 0,
                          child: Text(
                            '${medicationModel.price}\$',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: controller.infoDes.$2,
                              decorationStyle: TextDecorationStyle.solid,
                              color: AppColor.white,
                              fontSize: AppConstants.val_11,
                              height: 1,
                              fontWeight: FontWeight.w600,
                              shadows: [
                                BoxShadow(
                                  color: controller.infoDes.$2,
                                  blurRadius: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: AppConstants.val_2),
                        Text(
                          "${medicationModel.finalPrice}\$",
                          style: TextStyle(
                              color: controller.infoDes.$2,
                              height: 1,
                              fontSize: AppConstants.val_12,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    LikeButton(
                      isLiked: medicationModel.favorate,
                      onTap: (value) {
                        return controller.favorite(medicationModel, value);
                      },
                      circleColor: CircleColor(
                        start: controller.infoDes.$2,
                        end: controller.infoDes.$2,
                      ),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: controller.infoDes.$2,
                        dotSecondaryColor: controller.infoDes.$2,
                      ),
                      padding: const EdgeInsets.all(0),
                      mainAxisAlignment: MainAxisAlignment.end,
                      likeCountPadding: const EdgeInsets.all(0),
                      size: 24,
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.favorite,
                          color: isLiked
                              ? controller.infoDes.$2
                              : AppColor.grey, // Change the color as needed
                          size: AppConstants.val_24,
                        );
                      },
                    ),
                  ],
                ),
              ),

              //*

              ElevatedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size.zero),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        controller.infoDes.$2)),
                onPressed: () {
                  customAwesomeDialogAddToCart(
                      infoDes: controller.infoDes,
                      medicationModel: medicationModel);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: AppBorderRadius.borderRadius_20),
                  width: widthItem * 0.8,
                  height: heightItem * 0.16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ShowImageSvg(
                        path: AppAssetsSvg.cartPlus,
                        height: AppConstants.val_22,
                      ),
                      SizedBox(width: widthItem * 0.05),
                      Text(
                        AppTextsEnglish.add_to_cart.tr,
                        style: const TextStyle(
                            color: AppColor.background,
                            fontSize: AppConstants.val_13,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer()
            ],
          )),
    );
  }
}
