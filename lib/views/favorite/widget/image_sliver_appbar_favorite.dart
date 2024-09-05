// import 'package:bio_medika/core/constant/app_assets_png.dart';
// import 'package:bio_medika/core/constant/app_colors.dart';
// import 'package:bio_medika/core/constant/app_constant.dart';
// import 'package:bio_medika/controllers/favorite_controller.dart';
// import 'package:bio_medika/core/constant/app_texts.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomImageSliverAppBarFavorite extends StatelessWidget {
//   const CustomImageSliverAppBarFavorite({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<FavoriteControllerImp>();
//     return SliverAppBar(
//       automaticallyImplyLeading: false,
//       backgroundColor: AppColor.background,
//       bottom: const PreferredSize(
//         preferredSize: Size.fromHeight(-AppConstants.val_10),
//         child: SizedBox(),
//       ),
//       elevation: AppConstants.val_0,
//       pinned: true,
//       centerTitle: true,
//       stretch: true,
//       stretchTriggerOffset: AppConstants.val_300,
//       expandedHeight: AppConstants.val_250,
//       flexibleSpace:
//           LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           controller.updateTitleOpacity(AppConstants.val_1 -
//               (constraints.maxHeight - kToolbarHeight) /
//                   (AppConstants.val_250 - kToolbarHeight));
//         });
//         return FlexibleSpaceBar(
//           stretchModes: const [
//             StretchMode.zoomBackground,
//           ],
//           collapseMode: CollapseMode.parallax,
//           background: const Image(
//             fit: BoxFit.cover,
//             image: AssetImage(AppAssetsPng.sliverFavorites),
//           ),
//           centerTitle: true,
//           expandedTitleScale: AppConstants.val_2,
//           title: Opacity(
//               opacity: controller.titleOpacity > 0.8
//                   ? AppConstants.val_1
//                   : controller.titleOpacity,
//               child: Text(
//                 AppTextsEnglish.Favorite.tr,
//                 style: const TextStyle(
//                     fontSize: AppConstants.val_28,
//                     color: AppColor.searchTextFormFill,
//                     fontWeight: FontWeight.bold),
//               )),
//           titlePadding: const EdgeInsets.all(AppConstants.val_4),
//         );
//       }),
//     );
//   }
// }
