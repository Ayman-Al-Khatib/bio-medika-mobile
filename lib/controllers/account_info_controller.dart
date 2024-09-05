import 'dart:io';

import 'package:bio_medika/controllers/tiny_tasks/up_image_and_name_controller.dart';
import 'package:bio_medika/core/constant/app_colors.dart';
import 'package:bio_medika/core/constant/app_constant.dart';
import 'package:bio_medika/core/constant/app_texts.dart';
import 'package:bio_medika/core/data/accont_infomation_data.dart';
import 'package:bio_medika/core/enum/status_request_enum.dart';
import 'package:bio_medika/core/enum/type_pick.dart';
import 'package:bio_medika/core/navigation/app_routes.dart';
import 'package:bio_medika/core/services/my_services.dart';
import 'package:bio_medika/core/ui/shared/snacbar_widget.dart';
import 'package:bio_medika/models/response_data.dart';
import 'package:bio_medika/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class AccountInformationController extends GetxController {
  validation();
  configureFocusNodes();
  changeStateRead();
  changeInformation();
  configureTextEditingController();
  Future<void> pickImage(TypePick typePick);
  File? image;
  actionButton();
}

class AccountInformationControllerImp extends AccountInformationController {
  late TextEditingController email;
  late TextEditingController name;
  late TextEditingController pharmacyName;
  late TextEditingController phone;
  late TextEditingController city;
  late TextEditingController district;
  late TextEditingController street;
  late TextEditingController landmark;
  late TextEditingController oldPassword;
  late TextEditingController newPassword;
  late TextEditingController confirmPassword;

  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode nameFocusNode;
  late FocusNode pharmacyNameFocusNode;
  late FocusNode phoneFocusNode;
  late FocusNode cityFocusNode;
  late FocusNode districtFocusNode;
  late FocusNode streetFocusNode;
  late FocusNode landmarkFocusNode;
  late FocusNode oldPasswordFocusNode;
  late FocusNode newPasswordFocusNode;
  late FocusNode confirmPasswordFocusNode;

  late bool readOnly;
  late GlobalKey<FormState> formState;
  late StatusRequest statusRequest;
  late MyAppServices myAppServices;
  late AccountInformationData accountInformationData;
  late UserModel userModel;
  @override
  validation() {
    if (formState.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  changeStateRead() {
    readOnly = !readOnly;
    update();
  }

  @override
  changeInformation() async {
    if (validation()) {
      statusRequest = StatusRequest.loading;
      update();
      Map<String, dynamic> data = {
        'name': name.text,
        'pharmacy_name': pharmacyName.text,
        'city': city.text,
        'street': street.text,
        'district': district.text,
        'landmark': landmark.text,
        'phone_number': phone.text,
        'old_password': oldPassword.text,
        'new_password': newPassword.text,
      };

      ResponseData response = await accountInformationData
          .updateInformationWithImage(data, image, 'image');

      if (response.statusRequest == StatusRequest.success) {
        response.data['token'] = UserModel.get().token;
        userModel = await UserModel.fromJson(response.data).save();

        Get.find<UpImageAndNameControllerImp>().reset();

        statusRequest = StatusRequest.success;
        readOnly = true;
        image = null;
        update();
      }

      await showCustomSnackbar(
        title: AppTextsEnglish.Account_Information.tr,
        message: statusRequest == StatusRequest.success
            ? AppTextsEnglish.User_information_has_been_successfully_updated.tr
            : AppTextsEnglish
                .Failed_to_update_user_information_Try_again_later.tr,
        backgroundGradient: LinearGradient(
          colors: statusRequest == StatusRequest.success
              ? [AppColor.profilePackground_2, AppColor.primary]
              : [AppColor.redAccent, AppColor.pinkAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppConstants.val_15,
        duration: const Duration(seconds: 3),
      ).then((value) {});
    }
  }

  @override
  Future<void> pickImage(TypePick typePick) async {
    try {
      ImagePicker picker = ImagePicker();
      XFile? pickedFile;

      if (typePick == TypePick.camera) {
        pickedFile = await picker.pickImage(source: ImageSource.camera);
      } else if (typePick == TypePick.gallery) {
        pickedFile = await picker.pickImage(source: ImageSource.gallery);
      }

      if (pickedFile != null) {
        image = File(pickedFile.path);
        update();
      } else {}
    } catch (_) {}
    NavigationService.pop();
  }

  @override
  actionButton() {
    if (readOnly) {
      changeStateRead();
    } else {
      changeInformation();
    }
  }

  @override
  void configureFocusNodes() {
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    nameFocusNode = FocusNode();
    pharmacyNameFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    cityFocusNode = FocusNode();
    districtFocusNode = FocusNode();
    streetFocusNode = FocusNode();
    landmarkFocusNode = FocusNode();
    oldPasswordFocusNode = FocusNode();
    newPasswordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();

    emailFocusNode.addListener(() => update());
    passwordFocusNode.addListener(() => update());
    nameFocusNode.addListener(() => update());
    pharmacyNameFocusNode.addListener(() => update());
    phoneFocusNode.addListener(() => update());
    cityFocusNode.addListener(() => update());
    districtFocusNode.addListener(() => update());
    streetFocusNode.addListener(() => update());
    landmarkFocusNode.addListener(() => update());
    oldPasswordFocusNode.addListener(() => update());
    newPasswordFocusNode.addListener(() => update());
    confirmPasswordFocusNode.addListener(() => update());
  }

  @override
  configureTextEditingController() {
    email = TextEditingController()..text = userModel.email;
    name = TextEditingController()..text = userModel.name;
    pharmacyName = TextEditingController()..text = userModel.pharmacyName;
    phone = TextEditingController()..text = userModel.phoneNumber;
    city = TextEditingController()..text = userModel.city;
    district = TextEditingController()..text = userModel.district;
    street = TextEditingController()..text = userModel.street;
    landmark = TextEditingController()..text = userModel.landmark;
    oldPassword = TextEditingController();
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void onInit() {
    super.onInit();
    userModel = UserModel.get();
    accountInformationData = AccountInformationData(Get.find());
    myAppServices = Get.find();
    statusRequest = StatusRequest.none;
    readOnly = true;
    formState = GlobalKey<FormState>();

    configureTextEditingController();
    configureFocusNodes();
  }

  @override
  void dispose() {
    email.dispose();
    name.dispose();
    pharmacyName.dispose();
    phone.dispose();
    city.dispose();
    district.dispose();
    street.dispose();
    landmark.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    nameFocusNode.dispose();
    pharmacyNameFocusNode.dispose();
    phoneFocusNode.dispose();
    cityFocusNode.dispose();
    districtFocusNode.dispose();
    streetFocusNode.dispose();
    landmarkFocusNode.dispose();

    super.dispose();
  }
}
