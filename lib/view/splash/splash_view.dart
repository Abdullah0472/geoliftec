import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
  // @override
  // void initState() {
  //   super.initState();
  //  Timer(const Duration(seconds: 3), () => Get.toNamed(RouteName.signInView));
  //
  //   // 1. This method call when app in terminated state and you get a notification
  //   // when you click on notification app open from terminated state and you can get notification data in this method
  //
  //   FirebaseMessaging.instance.getInitialMessage().then(
  //         (message) {
  //       print("FirebaseMessaging.instance.getInitialMessage");
  //       if (message != null) {
  //         print("New Notification");
  //         // if (message.data['_id'] != null) {
  //         //   Navigator.of(context).push(
  //         //     MaterialPageRoute(
  //         //       builder: (context) => DemoScreen(
  //         //         id: message.data['_id'],
  //         //       ),
  //         //     ),
  //         //   );
  //         // }
  //       }
  //     },
  //   );
  //
  //   // 2. This method only call when App in forground it mean app must be opened
  //   FirebaseMessaging.onMessage.listen(
  //         (message) {
  //       print("FirebaseMessaging.onMessage.listen");
  //       if (message.notification != null) {
  //         print(message.notification!.title);
  //         print(message.notification!.body);
  //         print("message.data11 ${message.data}");
  //          LocalNotificationService.createanddisplaynotification(message);
  //
  //       }
  //     },
  //   );
  //
  //   // 3. This method only call when App in background and not terminated(not closed)
  //   FirebaseMessaging.onMessageOpenedApp.listen(
  //         (message) {
  //       print("FirebaseMessaging.onMessageOpenedApp.listen");
  //       if (message.notification != null) {
  //         print(message.notification!.title);
  //         print(message.notification!.body);
  //         print("message.data22 ${message.data['_id']}");
  //       }
  //     },
  //   );
  //
  //
  // }

  final signInVM = Get.put(SignInViewModel());
  @override
  void initState() {
    super.initState();
      Timer(const Duration(seconds: 3), () => Get.toNamed(RouteName.signInView));
    FirebaseMessaging.instance.getInitialMessage().then(
          (message) {
        // Handle notification when app is launched from terminated state
        if (message != null) {
          print("New Notification");
          // Handle notification data and navigate to appropriate screen
        }
      },
    );
   //  LocalNotificationService.initialize().then((String? fcmToken) {
   //    // Call your LoginApi() with the obtained fcmToken
   // signInVM.LoginApi();
   //  });
    FirebaseMessaging.onMessage.listen(
          (message) {
        // Handle notification when app is in the foreground
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          // Handle notification data and show local notification
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        // Handle notification when app is in the background but not terminated
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          // Handle notification data and navigate to appropriate screen
        }
      },
    );
  }
  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    final token = await _fcm.getToken();
    var deviceTokenToSendPushNotification = token.toString();
    print("Token Value $deviceTokenToSendPushNotification");
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
                height: Get.height * 0.85,
                width: Get.width * 0.65,
                child: Image.asset(ImageAssets.appScreen),
              ),
            ),
            const Spacer(),
             Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Powered By : Kusawa ",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: AppColor.drakerColor,
                    ),
                  ),
                  Icon(MdiIcons.copyright),
                  Text(
                    " 2023",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: AppColor.drakerColor,
                    ),
                  ),
                ],
              ),

            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
