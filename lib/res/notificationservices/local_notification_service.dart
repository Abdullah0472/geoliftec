import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<String?> initialize() async {
    // Initialization settings for Android
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );
    await _notificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: (String? id) async {
      //   // Handle the notification tap action
      //   if (id != null && id.isNotEmpty) {
      //     print("Router Value1234 $id");
      //     // Navigate to the desired screen with the provided ID
      //     // Example:
      //     // Navigator.of(context).push(
      //     //   MaterialPageRoute(
      //     //     builder: (context) => DemoScreen(
      //     //       id: id,
      //     //     ),
      //     //   ),
      //     // );
      //   }
      // },
    );
    // Retrieve FCM token
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    if (kDebugMode) {
      print('Firebase Cloud Messaging token: $fcmToken');
    }
    return fcmToken;
  }

  static void createAndDisplayNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "pushnotificationapp",
          "pushnotificationappchannel",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } catch (e) {
      if (kDebugMode) {
        print('Failed to create and display notification: $e');
      }
    }
  }
}
