import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    DarwinInitializationSettings iosInitializationSettings =
        const DarwinInitializationSettings(defaultPresentSound: false);

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    if (Platform.isAndroid) {
      await AndroidFlutterLocalNotificationsPlugin()
          .requestNotificationsPermission();
    }
    if (Platform.isIOS) {
      await IOSFlutterLocalNotificationsPlugin().requestPermissions();
    }

    await notificationsPlugin.initialize(initializationSettings);
  }

  notificationDetails(int id) {
    return NotificationDetails(
      iOS: const DarwinNotificationDetails(
        sound: 'sound.wav',
        presentSound: true,
      ),
      android: AndroidNotificationDetails(
        'Todo',
        id.toString(),
        playSound: true,
        priority: Priority.max,
        importance: Importance.max,
        sound: const RawResourceAndroidNotificationSound('sound'),
      ),
    );
  }

  Future showNotification({
    required int id,
    required String? body,
    required String? title,
  }) async {
    return notificationsPlugin.show(
      id,
      title,
      body,
      await notificationDetails(id),
    );
  }

  Future<void> remove(int id) async {
    Future.delayed(const Duration(seconds: 5)).then(
      (value) async => await notificationsPlugin.cancel(id),
    );
  }
}
