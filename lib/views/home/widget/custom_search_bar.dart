import 'dart:math';

import 'package:bio_medika/core/constant/app_assets_svg.dart';
import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/enum/typy_search.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/core/utils/show_image_svg.dart';
import 'package:flutter/material.dart';

class CustomSearchBarWidget extends StatelessWidget {
  const CustomSearchBarWidget({
    super.key,
    required this.hint,
    this.suffixIcon,
    required this.size,
    this.sideIcon,
    this.controller,
    this.focusNode,
    this.color = AppColor.iconAndTextGrey,
    this.backgroundColor = AppColor.searchTextFormFill,
    this.textInputColor = AppColor.black,
    this.cursorColor,
    this.onTap,
    this.typeSearch = TypeSearch.inDrug,
  });

  final Size size;
  final String hint;
  final bool? suffixIcon;
  final bool? sideIcon;
  final Color color;
  final Color? backgroundColor;
  final Color? textInputColor;
  final Color? cursorColor;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final TypeSearch typeSearch;
  @override
  Widget build(BuildContext context) {
    double height = max(size.height * 0.055, AppConstants.val_60);
    return Container(
      height: height,
      width: size.width,
      padding: EdgeInsets.only(
        left: size.width * AppConstants.horizontalPadding,
        right: size.width * AppConstants.horizontalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 12,
            child: ClipRRect(
              borderRadius: AppBorderRadius.borderRadius_16,
              child: TextFormField(
                controller: controller,
                focusNode: focusNode,
                cursorColor: cursorColor,
                style: TextStyle(
                    color: textInputColor,
                    fontSize: AppConstants.val_16,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(AppConstants.val_16),
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: color,
                    fontSize: AppConstants.val_14,
                  ),
                  prefixIcon: Container(
                    width: AppConstants.val_20,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: AppConstants.val_12),
                    child: ShowImageSvg(
                      path: AppAssetsSvg.search,
                      width: AppConstants.val_24,
                      height: AppConstants.val_24,
                      color: color,
                    ),
                  ),
                  suffixIcon: suffixIcon == null || suffixIcon == false
                      ? null
                      : Container(
                          width: AppConstants.val_55,
                          alignment: Alignment.centerRight,
                          padding:
                              const EdgeInsets.only(right: AppConstants.val_15),
                          child: GestureDetector(
                            onTap: () {
                              onTap!();
                            },
                            child: typeSearch == TypeSearch.inCategory
                                ? Icon(
                                    Icons.category,
                                    color: color,
                                    size: AppConstants.val_28,
                                  )
                                : Icon(
                                    Icons.medication_liquid,
                                    color: color,
                                    size: AppConstants.val_28,
                                  ),
                          ),
                        ),
                  filled: true,
                  fillColor: backgroundColor,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Visibility(
              visible: sideIcon == null ? false : sideIcon!,
              child: const SizedBox(width: AppConstants.val_8)),
          Visibility(
            visible: sideIcon == null ? false : sideIcon!,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: AppBorderRadius.borderRadius_15,
              ),
              height: height,
              width: height + AppConstants.val_8,
              child: InkWell(
                onTap: () {
                  NavigationService.cart();
                },
                child: Align(
                  child: ShowImageSvg(
                      width: AppConstants.val_35,
                      height: AppConstants.val_35,
                      path: AppAssetsSvg.cart,
                      color: color),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
