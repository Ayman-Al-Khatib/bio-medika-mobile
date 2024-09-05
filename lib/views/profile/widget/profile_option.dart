import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:flutter/material.dart';

class ProfileOption extends StatelessWidget {
  const ProfileOption(
      {super.key, required this.title, required this.iconData, this.onTap});

  final String title;
  final IconData iconData;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.val_20),
      child: Material(
        color: AppColor.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppConstants.val_20),
        child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.val_20)),
          splashColor: AppColor.primary.withOpacity(0.3),
          onTap: onTap,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppConstants.val_5),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: AppConstants.val_16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: AppColor.primary,
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: AppColor.primary,
          ),
        ),
      ),
    );
  }
}
