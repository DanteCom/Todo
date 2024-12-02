import 'create_goal_state.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/app/domain/models/models.dart';
import 'package:todo/app/ui/widgets/dialogs/dialogs.dart';

class HealthState extends ChangeNotifier {
  final _box = Hive.box('goals');

  List<GoalModel> _goalsList = [];

  HealthState() {
    loadGoals();
    _box.listenable().addListener(loadGoals);
  }

  // Variabls

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

  List<GoalModel> get goalsList => _goalsList;

  // Functions

  Future<void> onCreateGoal(BuildContext context) async {
    final goal = await showDialog(
      context: context,
      builder: (context) => ChangeNotifierProvider(
        create: (context) => CreateGoalState(),
        child: const CreateGoalDialog(),
      ),
    );
    addGoal(goal);
  }

  void addGoal(GoalModel? goal) {
    if (goal == null) return;

    GoalModel.addOrEdit(goal);

    notifyListeners();
  }

  void changeWeeks() {}

  void editGoal() {}

  Future<void> loadGoals() async {
    _goalsList = await GoalModel.getAll();

    notifyListeners();
  }

  String capitalize(String s) => toBeginningOfSentenceCase(s);
}
