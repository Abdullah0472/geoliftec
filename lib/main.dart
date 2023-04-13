import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geoliftec/res/colors/colors.dart';
import 'package:geoliftec/res/notificationservices/local_notification_service.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:geoliftec/res/routes/routes.dart';
import 'package:geoliftec/view/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  FirebaseMessaging.onMessage.listen(
        (message) {
      if (message.notification != null) {
        String title = message.notification!.title ?? 'Notification';
        String body = message.notification!.body ?? 'You have a new notification';
        print('Title: $title');
        print('Body: $body');

        // Show local notification using flutter_local_notifications plugin
        LocalNotificationService.createAndDisplayNotification(message);
      }
    },
  );

  ///------------------------------///

  runApp(const MyApp());

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');
}

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

String baseUrl = "38.242.154.202";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(

        const SystemUiOverlayStyle(statusBarColor: AppColor.appBarColor));
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => ResponsiveWrapper.builder(
      child,
      maxWidth: 1200,
      minWidth: 480,
      defaultScale: true,
      breakpoints: [
        const ResponsiveBreakpoint.resize(480, name: MOBILE),
        const ResponsiveBreakpoint.autoScale(800, name: TABLET),
        const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
      ],
    ),
      home: WillPopScope(

        onWillPop: () async {
          return false;
        },
        child: const SplashView(),
      ),
      getPages: AppRoutes.appRoutes(),
    );
  }
}

