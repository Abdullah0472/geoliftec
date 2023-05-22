import 'package:flutter/material.dart';
import 'package:geoliftec/res/assets/images/images.dart';
import 'package:geoliftec/res/colors/colors.dart';
import 'package:geoliftec/res/components/widgets/formfield/input_email_widget.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../res/components/widgets/buttons/round_button_widget.dart';
import '../../res/components/widgets/formfield/input_password_widget.dart';
import 'package:flutter/services.dart';

import '../../view_mode/controller/signin/signin_view_model.dart';

// ignore: must_be_immutable
class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);

  final signInVM = Get.put(SignInViewModel());

  GlobalKey<FormState> signinformkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Close the app when the back button is pressed
      onWillPop: () async {
        // Close the app when the back button is pressed
        SystemNavigator.pop();
        return Future.value(false); // Return false to allow the app to close
      },
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Positioned(
                  right: -8,
                  child: IconButton(
                      onPressed: () {
                        signInVM.buildLanguageDialog(context);
                      },
                      icon: const Icon(
                        MdiIcons.web,
                        size: 35,
                        color: AppColor.buttonColor,
                      )),
                ),
                 Positioned(
                    right: 5,
                    top: 38,
                    child: Text(
                      'changelang'.tr,
                      style: const TextStyle(
                          color: AppColor.buttonColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )),
                Form(
                    key: signinformkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 150, horizontal: 60),
                          child: Image.asset(ImageAssets.appScreen),
                        ),
                        Text(
                          'signin'.tr,
                          style: const TextStyle(
                              fontSize: 32.5, color: AppColor.drakerColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InputEmailTextField(
                            validator: signInVM.validateEmail,
                            controller: signInVM.emailController.value,
                            icons: const Icon(
                              Icons.email,
                              color: AppColor.greyColor,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        InputPasswordTextField(
                          validator: signInVM.validatePassword,
                          isPasswordType: true,
                          controllerpass: signInVM.passwordController.value,
                          icons: const Icon(Icons.lock, color: AppColor.greyColor),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        RoundButton(
                          width: Get.width,
                          height: Get.height * 0.06,
                          onPress: () {
                            if (signinformkey.currentState!.validate()) {
                              signInVM.LoginApi();
                              signInVM.emailController.value.clear();
                              signInVM.passwordController.value.clear();
                            }
                          },
                          title: 'buttonTextSignIn'.tr,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
