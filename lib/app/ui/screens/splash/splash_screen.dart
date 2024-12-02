import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/resources/resources.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/app/ui/routes/routes.dart';
import 'package:todo/app/domain/services/notifications_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _box = Hive.box('settings');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final isOnboardShown = await _box.get('onboarding', defaultValue: false);

      await Future.delayed(Durations.extralong2);

      await NotificationsService().showNotification(
        id: 0,
        title: 'Todo',
        body: 'Welcome To Flutter Todo App',
      );

      NotificationsService().remove(0);

      if (!mounted) return;

      if (isOnboardShown) {
        context.goNamed(RouteNames.tabbar);
      } else {
        context.goNamed(RouteNames.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: Image.asset(
              fit: BoxFit.cover,
              Images.onboardCube,
              width: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
