import 'package:flutter/material.dart';
import 'package:geoliftec/res/assets/images/images.dart';
import 'package:geoliftec/res/colors/colors.dart';
import 'package:geoliftec/res/components/widgets/formfield/input_email_widget.dart';
import 'package:get/get.dart';
import '../../res/components/widgets/buttons/round_button_widget.dart';
import '../../res/components/widgets/formfield/input_password_widget.dart';
import '../../res/routes/routes_name.dart';
import '../../view_mode/controller/signin/signin_view_model.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final signInVM = Get.put(SignInViewModel());
  GlobalKey<FormState> signinformkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColor.drakerColor),
              ),
              Form(
                  key: signinformkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 55, horizontal: 60),
                        child: Image.asset(ImageAssets.appScreen),
                      ),
                      const SizedBox(
                        height: 75,
                      ),
                      InputEmailTextField(
                          validator: signInVM.validateEmail,
                          controller: signInVM.emailController.value,
                          icons: const Icon(
                            Icons.email,
                            color: AppColor.greyColor,
                          )),
                      const SizedBox(
                        height: 35,
                      ),
                      InputPasswordTextField(
                        validator: signInVM.validatePassword,
                        isPasswordType: true,
                        controllerpass: signInVM.passwordController.value,
                        icons:
                            const Icon(Icons.lock, color: AppColor.greyColor),
                      ),
                      const SizedBox(
                        height: 35,
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
                        title: 'SIGN IN',
                      ),
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
