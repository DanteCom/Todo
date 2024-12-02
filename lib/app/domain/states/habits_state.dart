import 'package:intl/intl.dart';
import 'create_habit_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/app/domain/models/models.dart';
import 'package:todo/app/ui/widgets/dialogs/dialogs.dart';

class HabitsState extends ChangeNotifier {
  final _box = Hive.box('habits');

  HabitsState() {
    loadHabits();
    _box.listenable().addListener(loadHabits);
  }

  // Variabls
  List<HabitModel> _habitsList = [];

  List<HabitModel> _todayHabits = [];

  // Getters

  List<HabitModel> get habitsList => _habitsList;

  List<HabitModel> get todayHabits => _todayHabits;

  // Functions

  void onCreateHabit(BuildContext context) async {
    final habit = await showDialog(
      context: context,
      builder: (context) => ChangeNotifierProvider(
        create: (context) => CreateHabitState(),
        child: const CreateHabitDialog(),
      ),
    );
    addHabit(habit);
  }

  void addHabit(HabitModel? habit) {
    if (habit == null) return;

    HabitModel.addOrEdit(habit);

    notifyListeners();
  }

  Future<void> loadHabits() async {
    _habitsList = await HabitModel.getAll();

    _todayHabits = _habitsList
        .where((habit) => habit.type == PeriodicityType.daily)
        .toList();

    notifyListeners();
  }

  void delete(BuildContext contex, HabitModel habit) {
    contex.pop();

    habit.delete();
  }

  String capitalize(String s) => toBeginningOfSentenceCase(s);
}
