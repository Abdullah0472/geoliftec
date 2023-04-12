

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geoliftec/main.dart';
import 'package:geoliftec/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../../res/notificationservices/local_notification_service.dart';
import '../../../res/routes/routes_name.dart';

class SignInViewModel extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  ////////////////////////Validation for Email///////////////////////////
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Your Email";
    }
    if (!GetUtils.isEmail(value)) {
      return "Enter Valid Email";
    }
    return null;
  }

  ////////////////////////Validation for Password///////////////////////////
  String? validatePassword(String? value) {
    // RegExp regex =
    //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      // if (!regex.hasMatch(value)) {
      //   return 'Enter valid password';
      // } else
      if (value != passwordController.value.text) {
        "Not Match";
        return null;
      } else {
        return null;
      }
    }
  }

  var bearerToken;

  void LoginApi() async {
    //String? fcmToken = await FirebaseMessaging.instance.getToken();

    try {
     // print("FCM TOKEN IN API $fcmToken");
      final response = await post(Uri.parse('http://$baseUrl/api/login'), body: {
        'email': emailController.value.text,
        'password': passwordController.value.text,
        //'fcm_token': fcmToken,

      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
       // print('Firebase Cloud Messaging token: $fcmToken');
        if (data['data'] == null || data['data']['bearer_token'] == null) {
          throw Exception('Unexpected response from server');
        }

        bearerToken = data['data']['bearer_token'];
        Utils.snackBar('Login Successful', 'Welcome');
        Get.toNamed(RouteName.bottomNavBarView);
      } else if (response.statusCode == 401) {
        Utils.snackBar('Login Failed', 'Invalid email or password');
      } else {
        throw Exception('Unexpected response from server');
      }
    } catch (e) {
      print('Error during login request: $e');
      Utils.snackBar('Login Failed', 'An error occurred while logging in');
    }
  }
}
