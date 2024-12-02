import 'app/app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/app/domain/services/notifications_service.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tasks');
  await Hive.openBox('goals');
  await Hive.openBox('habits');
  await Hive.openBox('settings');
  await NotificationsService().initNotifications();
  runApp(const App());
}
