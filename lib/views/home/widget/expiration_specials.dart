import 'package:bio_medika/controllers/homa_page_controller.dart';
import 'package:bio_medika/core/constant/app_assets_png.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/enum/type_widget.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/core/ui/shared/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpirationSpecialsWidget extends StatelessWidget {
  const ExpirationSpecialsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * AppConstants.horizontalPadding,
      ),
      child: GetBuilder<HomaePageControllerImp>(builder: (controller) {
        return ShimmerBioMedica(
          typeWidget: TypeWidget.row,
          height: AppConstants.val_90,
          width: (size.width -
                  size.width * AppConstants.horizontalPadding * 2 -
                  size.width * 0.034) /
              AppConstants.val_2,
          borderRadius: AppBorderRadius.borderRadius_20,
          space: size.width * 0.034,
          loading: controller.statusRequest == StatusRequest.loading,
          child: Row(
            children: [
              buildClipRRectImage(AppAssetsPng.discount1, true),
              SizedBox(width: size.width * 0.034),
              buildClipRRectImage(AppAssetsPng.discount2, false),
            ],
          ),
        );
      }),
    );
  }

  Widget buildClipRRectImage(String imagePath, bool isOneMonth) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          NavigationService.expired(
              argument: {"isOneMonth": isOneMonth, "image": imagePath});
        },
        child: ClipRRect(
          borderRadius: AppBorderRadius.borderRadius_20,
          child: Hero(
            tag: imagePath,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
              height: AppConstants.val_90,
            ),
          ),
        ),
      ),
    );
  }
}
