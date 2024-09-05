// File: user_profile_screen.dart

import 'package:bio_medika/core/ui/shared/background_image.dart';
import 'package:bio_medika/core/ui/shared/user_name.dart';
import 'package:bio_medika/views/profile/widget/profile_avatar.dart';
import 'package:bio_medika/views/profile/widget/profile_details.dart';
import 'package:bio_medika/views/profile/widget/profile_top_bar.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundImage(),
        ProfileTopBar(),
        ProfileAvatar(),
        UserName(),
        ProfileDetails(),
      ],
    );
  }
}
