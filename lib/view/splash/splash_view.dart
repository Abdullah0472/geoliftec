import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geoliftec/view_mode/controller/review/review_view_model.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../res/assets/images/images.dart';
import '../../res/colors/colors.dart';
import '../../res/notificationservices/local_notification_service.dart';
import '../../res/routes/routes_name.dart';

import '../../view_mode/controller/signin/signin_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final signInVM = Get.put(SignInViewModel());
  final reviewVM = Get.put(ReviewViewModel());
  @override
  void initState()  {
    super.initState();
    reviewVM.groupValue = null;
    checkLoginStatus(); // Check login status when the view is initialized

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (RemoteMessage? message) {
        if (kDebugMode) {
          print("FirebaseMessaging.instance.getInitialMessage");
        }
        if (message != null) {
          if (kDebugMode) {
            print("New Notification");
          }
          // Handle the notification data and navigate to the appropriate screen
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        if (kDebugMode) {
          print("FirebaseMessaging.onMessage.listen");
        }
        if (message.notification != null) {
          if (kDebugMode) {
            print(message.notification!.title);
          }
          if (kDebugMode) {
            print(message.notification!.body);
          }
          if (kDebugMode) {
            print("message.data11 ${message.data}");
          }
          LocalNotificationService.createAndDisplayNotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        if (kDebugMode) {
          print("FirebaseMessaging.onMessageOpenedApp.listen");
        }
        if (message.notification != null) {
          if (kDebugMode) {
            print(message.notification!.title);
          }
          if (kDebugMode) {
            print(message.notification!.body);
          }
          if (kDebugMode) {
            print("message.data22 ${message.data['_id']}");
          }
        }
      },
    );
  }

  /// ============== Shared Preference ===============///
  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? bearerToken = prefs.getString('bearerToken');
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    String? fcmToken = prefs.getString('fcm_token');
     int? forkLifterId = prefs.getInt('forklift_id');
     print("The ForkLifterId in Splash Screen $forkLifterId");
    if (isLoggedIn == true &&
        bearerToken != null &&
        bearerToken.isNotEmpty &&
        fcmToken != null &&
        forkLifterId != 0
    ) {
      // User is logged in and bearer token is present
      // Navigate to BottomNavigationBarView
      // Timer(const Duration(seconds: 3),
      //     () => Get.toNamed(RouteName.bottomNavBarView));
      Timer(const Duration(seconds: 3),

              () => Get.offAllNamed(RouteName.bottomNavBarView));
    } else {
      // User is not logged in or bearer token is not valid
      // Navigate to SignInView
      // You can also clear the bearer token and login status from SharedPreferences here
      prefs.remove('bearerToken');
      await prefs.setBool(
          'isLoggedIn', false); // Wait for the flag to be updated
      Timer(const Duration(seconds: 3), () => Get.offAllNamed(RouteName.signInView));

    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: SizedBox(
                height: Get.height * 0.9,
                width: Get.width * 0.85,
                child: Image.asset(ImageAssets.appScreen),
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Powered By : Kusawa ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColor.drakerColor,
                    ),
                  ),
                  Icon(MdiIcons.copyright),
                  Text(
                    " 2023",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColor.drakerColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
