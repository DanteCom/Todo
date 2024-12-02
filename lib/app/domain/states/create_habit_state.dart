import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/app/domain/models/models.dart';

class CreateHabitState extends ChangeNotifier {
  // Variabls
  int _periodicityIndex = 0;

  int? _currentCategoryIndex;

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _repetitionsController = TextEditingController();

  // Getters

  int get periodicityIndex => _periodicityIndex;

  int? get currentCategoryIndex => _currentCategoryIndex;

  TextEditingController get nameController => _nameController;

  TextEditingController get repetitionsController => _repetitionsController;

  bool get isActive =>
      _currentCategoryIndex != null &&
      _nameController.text.trim().isNotEmpty &&
      _repetitionsController.text.trim().isNotEmpty;

  // Functions

  void changePeriodicityIndex(int index) {
    _periodicityIndex = index;

    notifyListeners();
  }

  void changeCategoryIndex(BuildContext context, int index) {
    FocusScope.of(context).unfocus();

    if (currentCategoryIndex == index) {
      _currentCategoryIndex = null;

      notifyListeners();
      return;
    }

    _currentCategoryIndex = index;

    notifyListeners();
  }

  void onSave(BuildContext context) {
    if (!isActive) return;

    final id = const Uuid().v4();

    final newHabit = HabitModel(
      id: id,
      name: _nameController.text.trim(),
      type: PeriodicityType.values[_periodicityIndex],
      repetitions: _repetitionsController.text.trim(),
      category: HabitModel.categories[_currentCategoryIndex!],
    );

    context.pop(newHabit);
  }

  void setState() => notifyListeners();

  String capitalize(String s) => toBeginningOfSentenceCase(s);
}
