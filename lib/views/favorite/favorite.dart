import 'package:bio_medika/controllers/favorite_controller.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/ui/components/handling_data.dart';
import 'package:bio_medika/views/favorite/widget/favorite_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());
    return GetBuilder<FavoriteControllerImp>(builder: (controller) {
      return RefreshIndicator(
          onRefresh: () {
            return controller.getAllFavorite();
          },
          child: controller.statusRequest == StatusRequest.offline ||
                  controller.statusRequest == StatusRequest.serverException ||
                  controller.statusRequest == StatusRequest.empty
              ? Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      RequestStatusHandler(
                          statusRequest: controller.statusRequest,
                          child: const SizedBox.shrink()),
                    ],
                  ),
                )
              : const FavoriteBody());
    });
  }
}
