import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/models/cart_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({
    required this.cartModel,
    super.key,
  });
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppConstants.val_40,
      backgroundColor: AppColor.white.withOpacity(0.08),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.val_13),
        child: CachedNetworkImage(
          imageUrl: cartModel.image,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            size: AppConstants.val_28,
            color: AppColor.profilePackground_2,
          ),
        ),
      ),
    );
  }
}
