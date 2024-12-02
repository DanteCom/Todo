import 'package:flutter/cupertino.dart';
import 'package:todo/app/ui/screens/tabbar/pages/pages.dart';

class TabbarState extends ChangeNotifier {
  // Variabls
  int _currentPage = 0;

  final List<StatelessWidget> _pages = [
    const HomePage(),
    const HealthPage(),
    const HabitsPage(),
    const SettingsPage(),
  ];

  // Getters

  int get currentPage => _currentPage;

  List<StatelessWidget> get pages => _pages;

  // Functions

  void onTabPress(int newIndex) {
    _currentPage = newIndex;

    notifyListeners();
  }
}
