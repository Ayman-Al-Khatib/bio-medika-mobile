// import 'package:bio_medika/controllers/tiny_tasks/user_name.dart';
// import 'package:bio_medika/core/constant/app_border_radius.dart';
// import 'package:bio_medika/core/constant/app_colors.dart';
// import 'package:bio_medika/core/constant/app_constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ProfileAvatar extends GetView<UpImageAndNameControllerImp> {
//   const ProfileAvatar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Padding(
//       padding: EdgeInsets.only(top: size.height * 0.11),
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: Container(
//           padding: const EdgeInsets.all(AppConstants.val_3),
//           decoration: const BoxDecoration(
//             borderRadius: AppBorderRadius.borderRadius_100,
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 AppColor.white,
//                 AppColor.white,
//               ],
//             ),
//           ),
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               GetBuilder<UpImageAndNameControllerImp>(builder: (controller) {
//                 return Container(
//                   clipBehavior: Clip.hardEdge,
//                   width: size.width * 0.35,
//                   height: size.width * 0.35,
//                   decoration: const BoxDecoration(
//                     borderRadius: AppBorderRadius.borderRadius_100,
//                     color: Colors.white,
//                   ),
//                   child: Image.network(
//                     controller.UserModel.imageUrl,
//                     fit: BoxFit.cover,
//                   ),
//                 );
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:bio_medika/controllers/tiny_tasks/up_image_and_name_controller.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/ui/shared/open_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animations/animations.dart';

class ProfileAvatar extends GetView<UpImageAndNameControllerImp> {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.05 + AppConstants.val_45),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: const EdgeInsets.all(AppConstants.val_3),
          decoration: const BoxDecoration(
            borderRadius: AppBorderRadius.borderRadius_100,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColor.white,
                AppColor.white,
              ],
            ),
          ),
          child: Container(
            clipBehavior: Clip.hardEdge,
            width: size.width * 0.35,
            height: size.width * 0.35,
            decoration: const BoxDecoration(
              borderRadius: AppBorderRadius.borderRadius_100,
            ),
            child:
                GetBuilder<UpImageAndNameControllerImp>(builder: (controller) {
              return OpenContainer(
                closedBuilder: (BuildContext _, VoidCallback openContainer) {
                  return CachedNetworkImage(
                    imageUrl: controller.userModel.imageUrl!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(
                      color: AppColor.primary,
                      strokeWidth: AppConstants.val_6,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  );
                },
                openBuilder: (BuildContext _, VoidCallback openContainer) {
                  return const OpenImage();
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
