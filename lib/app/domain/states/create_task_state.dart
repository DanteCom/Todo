import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/app/domain/models/models.dart';

class CreateTaskState extends ChangeNotifier {
  // Variabls
  int _categoryIndex = 0;

  int _periodicityIndex = 0;

  final String _date = '07.11.2024';

  final TextEditingController _controller = TextEditingController();

  // Getters
  String get date => _date;

  int get periodicityIndex => _periodicityIndex;

  int get categoryIndex => _categoryIndex;

  TextEditingController get controller => _controller;

  bool get isActive => _controller.text.trim().isNotEmpty;

  // Functions

  TaskCategory? getType() {
    if (_categoryIndex == 0) {
      return TaskCategory.work;
    }

    if (_categoryIndex == 1) {
      return TaskCategory.meetings;
    }

    if (_categoryIndex == 2) {
      return TaskCategory.home;
    }
    return null;
  }

  void onSave(BuildContext context) {
    if (isActive) {
      final id = const Uuid().v4();

      final newTesk = TaskModel(
        id: id,
        isActive: false,
        category: getType()!,
        name: controller.text.trim(),
        type: PeriodicityType.values[periodicityIndex],
      );

      context.pop(newTesk);
      return;
    }

    context.pop();
  }

  void changeCategoryIndex(int index) {
    _categoryIndex = index;

    notifyListeners();
  }

  void changePeriodicityIndex(int index) {
    _periodicityIndex = index;

    notifyListeners();
  }

  void setState() => notifyListeners();

  String capitalize(String s) => toBeginningOfSentenceCase(s);
}
