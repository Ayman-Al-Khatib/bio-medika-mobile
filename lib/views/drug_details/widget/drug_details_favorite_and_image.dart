import 'package:bio_medika/controllers/drug_details_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class DrugDetailsFavoriteWithImage extends GetView<DrugDetailsControllerImp> {
  const DrugDetailsFavoriteWithImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isArabic = Get.find<MyAppServices>().appIsArabic();
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.5 - size.height * 0.125),
      child: SizedBox(
        height: size.height * 0.25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: CircleAvatar(
                radius: size.width * 0.095,
                backgroundColor: controller.infoDes.$1,
                child:
                    GetBuilder<DrugDetailsControllerImp>(builder: (controller) {
                  return LikeButton(
                    isLiked: controller.medicationModel.favorate,
                    circleColor: CircleColor(
                      start: controller.infoDes.$2,
                      end: controller.infoDes.$2,
                    ),
                    onTap: (value) async {
                      return await controller.favorite(value);
                    },
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: controller.infoDes.$2,
                      dotSecondaryColor: controller.infoDes.$2,
                    ),
                    padding: const EdgeInsets.all(0),
                    mainAxisAlignment: MainAxisAlignment.center,
                    likeCountPadding: const EdgeInsets.all(0),
                    size: size.width * 0.095 + AppConstants.val_5,
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.favorite,
                        color: isLiked
                            ? controller.infoDes.$2
                            : AppColor.grey, // Change the color as needed
                        size: size.width * 0.095 + AppConstants.val_5,
                      );
                    },
                  );
                }),
              ),
            ),
            Expanded(
              flex: 6,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: AppConstants.val_15,
                    bottom: AppConstants.val_15,
                    right: isArabic ? AppConstants.val_10 : AppConstants.val_40,
                    left: isArabic ? AppConstants.val_40 : AppConstants.val_10,
                  ),
                  child: Hero(
                    tag: controller.tag ?? '',
                    child: CachedNetworkImage(
                      imageUrl: controller.medicationModel.imageUrl,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        size: AppConstants.val_28,
                        color: controller.infoDes.$2,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
