import 'package:bio_medika/core/constant/app_border_radius.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CartTotalPriceAndOrderButton extends StatelessWidget {
  const CartTotalPriceAndOrderButton({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 40,
      child: Row(
        children: [
          const Text('data'),
          InkWell(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: AppBorderRadius.borderRadius_16,
                color: AppColor.pinkAccent,
              ),
              child: const Row(
                children: [Text('df')],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
