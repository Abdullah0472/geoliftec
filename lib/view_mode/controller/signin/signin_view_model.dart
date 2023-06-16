import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geoliftec/main.dart';
import 'package:geoliftec/utils/utils.dart';
import 'package:geoliftec/view_mode/controller/review/review_view_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../res/routes/routes_name.dart';

class SignInViewModel extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  ////////////////////////Validation for Email///////////////////////////
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'validEmailText'.tr;
    }
    if (!GetUtils.isEmail(value)) {
      return 'validEmailText1'.tr;
    }
    return null;
  }

  ////////////////////////Validation for Password///////////////////////////
  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'validPasswordText'.tr;
    } else {

      if (value != passwordController.value.text) {
        'validPasswordText1'.tr;
        return null;
      } else {
        return null;
      }
    }
  }

  // ignore: prefer_typing_uninitialized_variables
  // var bearerToken;
  String? getToken;
  int? forkLiftId;

  String? fcmToken; // declare a nullable variable to hold the FCM token

  Future<String?> getFCMToken() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    return fcmToken;
  }

  // Callback for FCM token refresh
  void onTokenRefresh(String? token) {
    fcmToken = token; // update the fcmToken variable with the new token
  }

  void setupFCMTokenRefresh() {
    // listen for token refresh
    FirebaseMessaging.instance.onTokenRefresh.listen(onTokenRefresh);
  }

  Future<void> storeBearerToken(String bearertoken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('bearerToken', bearertoken);
  }

  Future<String?> getBearerToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('bearerToken');
  }

  /// ========================== Forklift Id =============================///

  Future<void> storeForkLiftId(int forklift_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('forklift_id', forklift_id);
  }

  Future<int?> getForkLiftId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('forklift_id');
  }

  // ignore: non_constant_identifier_names
  void LoginApi() async {
    try {
      Get.dialog(
        WillPopScope(
            child: const Center(child: CupertinoActivityIndicator()),
            onWillPop: () async {
              return false;
            }),
        barrierDismissible: true,
      );

      final response =
          await post(Uri.parse('http://$baseUrl/api/login'), body: {
        'email': emailController.value.text,
        'password': passwordController.value.text,
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['data'] == null || data['data']['bearer_token'] == null) {
          throw Exception('Unexpected response from server');
        }
        final int forklift_id = data['data']['forklift_id'];
        final String bearerToken = data['data']['bearer_token'];

        storeBearerToken(bearerToken);
        storeForkLiftId(forklift_id);

        getToken = await getBearerToken(); // Await for getBearerToken()
        forkLiftId = await getForkLiftId();

        String? fcmToken = await getFCMToken();
        updateFcmToken(fcmToken!);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('bearerToken', getToken!);
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('fcm_token', fcmToken);
        await prefs.setInt('forklift_id', forkLiftId!);

        if (forkLiftId == 0) {
          Utils.snackBar('noForkliftAssignText'.tr, 'tryAgainText'.tr);
          Get.dialog(
            WillPopScope(
                child: const Center(child: CupertinoActivityIndicator()),
                onWillPop: () async {
                  return false;
                }),
            barrierDismissible: false,
          );

          await Future.delayed(
              const Duration(seconds: 2)); // Delay for 2 seconds

          Get.back(); // Close the dialog
          Get.offAllNamed(
              RouteName.signInView); // Navigate back to login screen
          return; // End the function
        }

        Utils.snackBar(
            'loginSuccessSnackBarText'.tr, 'loginSuccessSnackBarText2'.tr);
        Get.toNamed(RouteName.bottomNavBarView);
      } else if (response.statusCode == 401) {
        Utils.snackBar('loginFailSnackBarText'.tr, 'loginFailSnackBarText2'.tr);
        // Add logic here to display activity indicator and navigate back after 2 seconds
        Get.dialog(
          WillPopScope(
              child: const Center(child: CupertinoActivityIndicator()),
              onWillPop: () async {
                return false;
              }),
          barrierDismissible: false,
        );

        await Future.delayed(const Duration(seconds: 2)); // Delay for 2 seconds

        Get.back(); // Close the dialog
        Get.offAllNamed(RouteName.signInView); // Navigate back to login screen
        return; // End the function
      } else {
        throw Exception('Unexpected response from server');
      }
    } catch (e) {
      Utils.snackBar(
          'loginFailSnackBarText'.tr, 'An error occurred while logging in');
      // Add logic here to display activity indicator and navigate back after 2 seconds
      Get.dialog(
        WillPopScope(
            child: const Center(child: CupertinoActivityIndicator()),
            onWillPop: () async {
              return false;
            }),
        barrierDismissible: false,
      );

      await Future.delayed(const Duration(seconds: 2)); // Delay for 2 seconds

      Get.back(); // Close the dialog
      Get.offAllNamed(RouteName.signInView); // Navigate back to login screen
      return; // End the function
    }
  }

  updateFcmToken(String fcmToken) async {
    final String? getTooken = await getBearerToken();
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
          'Authorization': 'Bearer $getTooken'
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

  void logoutApi() async {
    final String? getTooken = await getBearerToken();

    try {
      final response =
          await get(Uri.parse('http://$baseUrl/api/logout'), headers: {
        'Authorization':
            'Bearer $getTooken', // Include bearer token for authentication
      });
      if (response.statusCode == 200) {
        Utils.snackBar(
            'logoutSuccessSnackBarText'.tr, 'logoutSuccessSnackBarText2'.tr);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', false);
        emailController.value.clear();
        passwordController.value.clear();
        //bearerToken = null;

        Get.toNamed(RouteName.signInView);
      } else {
        throw Exception('Unexpected response from server');
      }
    } catch (e) {
      Utils.snackBar(
          'logoutFailSnackBarText'.tr, 'logoutExceptionSnackBarText2'.tr);
    }
  }

  final List locale = [
    {'name': 'English', 'locale': const Locale('en', 'US')},
    {'name': 'Española', 'locale': const Locale('es', 'SP')},
  ];

  final Rx<Locale> currentLocale =
      Rx<Locale>(const Locale('en', 'US')); // initial locale

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
    currentLocale.value = locale;

    // Update the radio size based on the selected language.
    if (locale.languageCode == 'es') {
      Get.find<ReviewViewModel>().radioSize.value = 150;
    } else {
      Get.find<ReviewViewModel>().radioSize.value = 180;
    }
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: const Text('Choose Your Language'),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          print(locale[index]['name']);
                          updateLanguage(locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }
}
