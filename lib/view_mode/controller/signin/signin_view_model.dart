import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geoliftec/main.dart';
import 'package:geoliftec/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
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

  // ignore: prefer_typing_uninitialized_variables
  var bearerToken;

  String? fcmToken; // declare a nullable variable to hold the FCM token

  Future<String?> getFCMToken() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    return fcmToken;
  }

  // Callback for FCM token refresh
  void onTokenRefresh(String? token) {
    if (kDebugMode) {
      print('FCM Token refreshed: $token');
    }
    fcmToken = token; // update the fcmToken variable with the new token
  }

  void setupFCMTokenRefresh() {
    // listen for token refresh
    FirebaseMessaging.instance.onTokenRefresh.listen(onTokenRefresh);
  }

  // ignore: non_constant_identifier_names
  void LoginApi() async {
    try {


      final response =
          await post(Uri.parse('http://$baseUrl/api/login'), body: {
        'email': emailController.value.text,
        'password': passwordController.value.text,
        // 'fcm_token': fcmToken??"",
      });
      // print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['data'] == null || data['data']['bearer_token'] == null) {
          throw Exception('Unexpected response from server');
        }

        bearerToken = data['data']['bearer_token'];
        Utils.snackBar('Login Successful', 'Welcome');
        Get.toNamed(RouteName.bottomNavBarView);
        String? fcmToken = await getFCMToken();
        updateFcmToken(fcmToken!);
        if (kDebugMode) {
          print("The FCM TOKEN IS: $fcmToken");
        }
      } else if (response.statusCode == 401) {
        Utils.snackBar('Login Failed', 'Invalid email or password');
      } else {
        throw Exception('Unexpected response from server');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during login request: $e');
      }
      Utils.snackBar('Login Failed', 'An error occurred while logging in');
    }
  }

  void updateFcmToken(String fcmToken) async {
    String apiUrl = 'http://$baseUrl/api/update/fcm/token';

    // Create a request body with the fcm_token value
    var body = {
      "fcm_token": fcmToken,
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(body), // Convert body to JSON string
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $bearerToken'
        },
      );

      if (response.statusCode == 200) {
        // Success! Do something with the response
        if (kDebugMode) {
          print('FCM token updated successfully');
        }
      } else if (response.statusCode == 401) {
        // Unauthorized error
        if (kDebugMode) {
          print(
            'Failed to update FCM token. Status code: ${response.statusCode}');
        }
        if (kDebugMode) {
          print('Error message: Unauthenticated');
        }
      } else {
        // Handle other error responses
        if (kDebugMode) {
          print(
            'Failed to update FCM token. Status code: ${response.statusCode}');
        }
        if (kDebugMode) {
          print('Error message: ${response.body}');
        }
      }
    } catch (e) {
      // Handle network error
      if (kDebugMode) {
        print('Failed to update FCM token. Exception: $e');
      }
    }
  }
}
