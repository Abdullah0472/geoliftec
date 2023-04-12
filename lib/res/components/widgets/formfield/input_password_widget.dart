import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';

import '../../../../view_mode/controller/signin/signin_view_model.dart';
import '../../../colors/colors.dart';

// ignore: must_be_immutable
class InputPasswordTextField extends StatefulWidget {
  final Icon icons;
  bool isPasswordType;
  final TextEditingController controllerpass;

  final String? Function(String?)? validator;
  InputPasswordTextField(
      {Key? key,
      required this.isPasswordType,
      required this.controllerpass,
      this.validator,
      required this.icons})
      : super(key: key);

  @override
  State<InputPasswordTextField> createState() => _InputPasswordTextFieldState();
}

class _InputPasswordTextFieldState extends State<InputPasswordTextField> {
  final signInVM = Get.put(SignInViewModel());
  void inContact(TapDownDetails details) {
    setState(() {
      widget.isPasswordType = false;
    });
  }

  void outContact(TapUpDetails details) {
    setState(() {
      widget.isPasswordType = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, signInVM.emailFocusNode.value,
            signInVM.passwordFocusNode.value);
      },
      controller: widget.controllerpass,
      obscureText: widget.isPasswordType,
      enableSuggestions: widget.isPasswordType,
      autocorrect: widget.isPasswordType,
      cursorColor: Colors.white,
      style: const TextStyle(color: AppColor.blackColor, fontSize: 17),
      minLines: 1,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: const TextStyle(
          color: AppColor.greyColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        hintText: 'Enter your password',
        hintStyle: const TextStyle(
          color: AppColor.lightgreyColor,
          fontSize: 18,
        ),
        prefixIcon: widget.icons,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        border: InputBorder.none,
        fillColor: const Color.fromARGB(255, 251, 250, 249),
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
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
          child: GestureDetector(
            onTapDown: inContact,
            onTapUp: outContact,
            child: const Icon(
              Icons.remove_red_eye,
              color: AppColor.blackColor,
            ),
          ),
        ),
      ),
      keyboardType: widget.isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      validator: widget.validator,
    );
  }
}
