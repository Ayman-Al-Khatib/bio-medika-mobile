import 'package:bio_medika/controllers/favorite_controller.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/enum/type_widget.dart';
import 'package:bio_medika/core/ui/components/handling_data.dart';
import 'package:bio_medika/core/ui/shared/shimmer.dart';
import 'package:bio_medika/views/favorite/widget/list_appbar_favorite.dart';
import 'package:bio_medika/views/favorite/widget/search_appbar_favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteBody extends GetView<FavoriteControllerImp> {
  const FavoriteBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteControllerImp>(builder: (controller) {
      return Column(
        children: [
          Visibility(
            visible: controller.statusRequest != StatusRequest.loading &&
                ((controller.listFavorite.isEmpty &&
                        controller.lastSearch != null) ||
                    controller.listFavorite.isNotEmpty),
            child: const Padding(
              padding: EdgeInsets.only(
                  top: AppConstants.val_4, bottom: AppConstants.val_4),
              child: CustomSearchAppBarFavorite(),
            ),
          ),
          Expanded(
            child: RequestStatusHandler(
              statusRequest: controller.statusRequest,
              loading: false,
              needSearch: true,
              isBottomNav: true,
              child: Column(
                children: [
                  Expanded(
                    child: ShimmerBioMedica(
                      borderRadius: AppBorderRadius.borderRadius_10,
                      height: 0,
                      width: 0,
                      loading:
                          controller.statusRequest == StatusRequest.loading,
                      typeWidget: TypeWidget.grid,
                      child: const CustomListGridAppBarFavorite(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
