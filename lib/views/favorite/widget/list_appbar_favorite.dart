import 'package:bio_medika/controllers/favorite_controller.dart';
import 'package:bio_medika/core/constant/app_constant.dart';

import 'package:bio_medika/views/favorite/widget/custom_favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListGridAppBarFavorite extends StatelessWidget {
  const CustomListGridAppBarFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppConstants.val_16,
        left: AppConstants.val_18,
        right: AppConstants.val_18,
        bottom: AppConstants.val_10,
      ),
      child: GetBuilder<FavoriteControllerImp>(builder: (controller) {
        return GridView.builder(
          padding: const EdgeInsets.only(bottom: AppConstants.val_78),
          itemCount: controller.listFavorite.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing:
                AppConstants.val_15, // width item = (size.width -15 -18 -18)/2
            mainAxisSpacing: AppConstants.val_15,
            childAspectRatio: 0.8, // height item = (width item) / 8 * 10
          ),
          itemBuilder: (BuildContext context, int index) {
            return CustomFavoriteItem(
              medicationModel: controller.listFavorite[index],
            );
          },
        );
      }),
    );
  }
}
