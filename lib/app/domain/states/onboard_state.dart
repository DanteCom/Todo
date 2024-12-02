import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/app/ui/routes/routes.dart';
import 'package:todo/app/ui/screens/onboarding/pages/pages.dart';

class OnboardState extends ChangeNotifier {
  // Variabls
  int _currentPage = 0;

  final Box _box = Hive.box('settings');

  final List<StatelessWidget> _pages = [
    const OnboardCubePage(),
    const OnboardStarPage(),
    const OnboardCirclePage(),
  ];

  // Getters

  Box get box => _box;

  int get currentPage => _currentPage;

  List<StatelessWidget> get pages => _pages;

  // Functions

  void onNext(BuildContext context) async {
    if (_currentPage == _pages.length - 1) {
      await _box.put('onboarding', true);

      if (!context.mounted) return;

      context.goNamed(RouteNames.tabbar);
      return;
    }

    _currentPage++;

    notifyListeners();
  }
}
