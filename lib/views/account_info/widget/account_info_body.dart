import 'package:bio_medika/core/ui/shared/background_image.dart';
import 'package:bio_medika/core/ui/shared/user_name.dart';
import 'package:bio_medika/views/account_info/widget/account_info_avatar.dart';
import 'package:bio_medika/views/account_info/widget/account_info_details.dart';
import 'package:bio_medika/views/account_info/widget/account_info_top_bat.dart';
import 'package:flutter/material.dart';

class AccountInformationBody extends StatelessWidget {
  const AccountInformationBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundImage(),
        AccountInformationTopBar(),
        AccountInformationvatar(),
        UserName(),
        AccountInformationDetails(),
      ],
    );
  }
}
