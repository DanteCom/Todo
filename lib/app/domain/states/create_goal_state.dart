import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/app/domain/models/models.dart';

class CreateGoalState extends ChangeNotifier {
  // Variabls
  int _categoryIndex = 0;

  final TextEditingController _minsControlller = TextEditingController();

  final TextEditingController _hoursControlller = TextEditingController();

  final TextEditingController _weaterController = TextEditingController();

  final TextEditingController _nameGoalController = TextEditingController();

  final TextEditingController _caloriesController = TextEditingController();

  final List<Weeks> _weeks = [
    Weeks(text: 'Monday', isActive: false),
    Weeks(text: 'Tuesday', isActive: false),
    Weeks(text: 'Wednesday', isActive: false),
    Weeks(text: 'Thursday', isActive: false),
    Weeks(text: 'Friday', isActive: false),
    Weeks(text: 'Saturday', isActive: false),
    Weeks(text: 'Sunday', isActive: false),
  ];

  // Getters

  List<Weeks> get weeks => _weeks;

  int get categoryIndex => _categoryIndex;

  TextEditingController get minsController => _minsControlller;

  TextEditingController get minsControlller => _minsControlller;

  TextEditingController get hoursControlller => _hoursControlller;

  TextEditingController get weaterController => _weaterController;

  TextEditingController get nameGoalController => _nameGoalController;

  TextEditingController get caloriesController => _caloriesController;

  bool get isActive => isFitnessActive || isWaterActive || isNutritionActive;

  bool get isFitnessActive => _nameGoalController.text.trim().isNotEmpty
      ? _minsControlller.text.trim().isNotEmpty ||
          _hoursControlller.text.trim().isNotEmpty
      : false;

  bool get isWaterActive =>
      _nameGoalController.text.trim().isNotEmpty &&
      _weaterController.text.trim().isNotEmpty;

  bool get isNutritionActive =>
      _nameGoalController.text.trim().isNotEmpty &&
      _caloriesController.text.trim().isNotEmpty;

  // Functions

  void changeCategoryIndex(int index) {
    _categoryIndex = index;

    notifyListeners();
  }

  void onSave(BuildContext context) {
    if (!isActive) return;

    final String id = const Uuid().v4();

    final newGoal = GoalModel(
      id: id,
      water: getWater(),
      fitness: getFitness(),
      nutrition: getNutrition(),
      name: _nameGoalController.text.trim(),
    );

    context.pop(newGoal);
  }

  FitnessModel? getFitness() {
    if (!isFitnessActive) return null;

    final String id = const Uuid().v4();

    final fitness = FitnessModel(
      id: id,
      weeks: _weeks,
      category: GoalModel.types[0],
      hours: _hoursControlller.text.trim().isNotEmpty
          ? _hoursControlller.text.trim()
          : null,
      mins: _minsControlller.text.trim().isNotEmpty
          ? _minsControlller.text.trim()
          : '00',
    );

    return fitness;
  }

  WaterModel? getWater() {
    if (!isWaterActive) return null;

    final String id = const Uuid().v4();

    final water = WaterModel(
      id: id,
      weeks: _weeks,
      category: GoalModel.types[1],
      ml: _weaterController.text.trim(),
    );

    return water;
  }

  NutritionModel? getNutrition() {
    if (!isNutritionActive) return null;

    final String id = const Uuid().v4();

    final nutrition = NutritionModel(
      id: id,
      weeks: _weeks,
      category: GoalModel.types[2],
      calories: _caloriesController.text.trim(),
    );

    return nutrition;
  }

  void setState() => notifyListeners();

  String capitalize(String s) => toBeginningOfSentenceCase(s);
}
