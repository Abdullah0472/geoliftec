import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../res/assets/images/images.dart';
import '../../res/colors/colors.dart';
import '../../res/notificationservices/local_notification_service.dart';
import '../../res/routes/routes_name.dart';
import '../../view_mode/controller/custom_inspection/custom_inspection_view_model.dart';
import '../../view_mode/controller/signin/signin_view_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../custom_inspection/custom_inspection_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final signInVM = Get.put(SignInViewModel());
  // final CustomInspectionViewModel controller =
  //     Get.put(CustomInspectionViewModel());


  // callApiAndReceiveNotifications(final int id) async {
  //   try {
  //     // Make the HTTP request to the API
  //     final response = await http.get(Uri.parse(
  //         'http://38.242.154.202/api/get/custom/inspection/details/$id'),
  //       headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer ${signInVM.bearerToken}'
  //       },
  //     );
  //
  //     // Check if the response was successful
  //     if (response.statusCode == 200) {
  //       // Parse the response body as JSON
  //       final responseBody = json.decode(response.body);
  //
  //       // Handle the notification data and navigate to the appropriate screen
  //       // For example, you can extract the data from the response body and pass it to another screen
  //      // Get.toNamed(RouteName.customInspectionView);
  //
  //       // Or you can handle the notification data directly in this method
  //       if (kDebugMode) {
  //         print('New Notification');
  //         print('Message data: $responseBody');
  //       }
  //     } else {
  //       // Handle any errors in the API response
  //       print('API request failed with status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     // Handle any errors that occur during the HTTP request
  //     print('Failed to make API request: $error');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Get.toNamed(RouteName.signInView));

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method
    //

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
    // final apiResponse = controller.apiResponse.value;
    // final data = apiResponse.data;
    // ListView.builder(
    //     itemCount: data.length,
    //     itemBuilder: (context, index) {
    //       return callApiAndReceiveNotifications(data[index].id);
    //     });
    // Call the method to make the API request and handle notifications
  }

  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging fcm = FirebaseMessaging.instance;
    final token = await fcm.getToken();
    var deviceTokenToSendPushNotification = token.toString();
    if (kDebugMode) {
      print("Token Value $deviceTokenToSendPushNotification");
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
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
