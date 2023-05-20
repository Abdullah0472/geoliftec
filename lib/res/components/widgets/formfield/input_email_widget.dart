import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geoliftec/view_mode/controller/signin/signin_view_model.dart';
import '../../../../utils/utils.dart';

import '../../../colors/colors.dart';

// ignore: must_be_immutable
class InputEmailTextField extends StatelessWidget {
  final Icon icons;
  TextEditingController controller;
  final String? Function(String?)? validator;
  final signInVM = Get.put(SignInViewModel());
  InputEmailTextField({
    super.key,
    required this.validator,
    required this.controller,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(
          context,
          signInVM.emailFocusNode.value,
          signInVM.passwordFocusNode.value,
        );
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: const TextStyle(
          color: AppColor.greyColor,
        ),
        hintText: 'Enter Your Email',
        hintStyle: const TextStyle(
          color: AppColor.lightgreyColor,
        ),
        prefixIcon: icons,
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        border: InputBorder.none,
        fillColor: const Color.fromARGB(255, 251, 250, 249),
        filled: true,
        suffixIconColor: Colors.grey,
        focusedErrorBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(10),
            ),
        disabledBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: AppColor.greyColor, width: 1.3)),
        focusedBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(
            //   10,
            // ),
            borderSide:
                const BorderSide(color: AppColor.greyColor, width: 1.3)),
        errorBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.redColor, width: 1.3)),
        enabledBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: AppColor.greyColor, width: 1.3)),
      ),
    );
  }
}
