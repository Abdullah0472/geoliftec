import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geoliftec/view_mode/controller/signin/signin_view_model.dart';
import '../../../../utils/utils.dart';

import '../../../../view_mode/controller/review/review_view_model.dart';
import '../../../colors/colors.dart';

// ignore: must_be_immutable
class InputReviewTextField extends StatelessWidget {
  final IconData icons;
  TextEditingController controller;
  final reviewVM = Get.put(ReviewViewModel());
  InputReviewTextField({
    super.key,
    required this.controller,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: (value) {
        Utils.fieldFocusReviewChange(
          context,
         reviewVM.radiatorFocusNode.value,
          reviewVM.engineFocusNode.value,
          reviewVM.hydraulicOilFocusNode.string,
          reviewVM.brakeFocusNode.string,
          reviewVM.batteryElectrolyteFocusNode.string,
          reviewVM.fuelFocusNode.string,
          reviewVM.leaksFocusNode.string,
          reviewVM.mastChainFocusNode.string,
          reviewVM.hydraulicDriveFocusNode.string,
          reviewVM.hydraulicHosesFocusNode.string,
          reviewVM.mirrorsFocusNode.string,
          reviewVM.pedalsFocusNode.string,
          reviewVM.tiresFocusNode.string,
          reviewVM.forksFocusNode.string,
          reviewVM.retroHornFocusNode.string,
          reviewVM.flasherBeaconFocusNode.string,

        );
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'reviewText'.tr,
        hintStyle: const TextStyle(
          color: AppColor.lightgreyColor,
          fontSize: 18,
        ),
        prefixIcon: Icon(icons,color: AppColor.drakerColor,),
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        border: InputBorder.none,
        fillColor: const Color.fromARGB(255, 251, 250, 249),
        filled: true,
        suffixIconColor: Colors.grey,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.greyColor, width: 1.3)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: const BorderSide(color: AppColor.greyColor, width: 1.3)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.redColor, width: 1.3)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.greyColor, width: 1.3)),
      ),
    );
  }
}
