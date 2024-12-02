import 'create_task_state.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/app/domain/models/models.dart';
import 'package:todo/app/ui/widgets/dialogs/dialogs.dart';

class HomeState extends ChangeNotifier {
  List<TaskModel> _tasksList = [];

  final _box = Hive.box('tasks');

  HomeState() {
    loadTaks();
    _box.listenable().addListener(loadTaks);
  }

  // Variabls

  int _periodicityIndex = 0;

  int _categoryIndex = 0;

  // Getters

  int get periodicityIndex => _periodicityIndex;

  int get categoryIndex => _categoryIndex;

  List<TaskModel> get tasksList => _tasksList;

  // Functions

  void showCreateTeskDialog(BuildContext context) async {
    final task = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ChangeNotifierProvider(
        create: (context) => CreateTaskState(),
        child: const CreateTaskDialog(),
      ),
    );
    if (task != null) addTask(task);
  }

  void changeCategoryIndex(int index) {
    _categoryIndex = index;

    loadTaks();

    notifyListeners();
  }

  void changePeriodicityIndex(int index) {
    _periodicityIndex = index;

    loadTaks();

    notifyListeners();
  }

  void addTask(TaskModel? task) {
    if (task == null) return;

    TaskModel.addOrEdit(task);

    loadTaks();

    notifyListeners();
  }

  void onCheckBox(int index, bool newValue) {
    final task = _tasksList[index].copyWith(isActive: newValue);

    TaskModel.addOrEdit(task);

    notifyListeners();
  }

  Future<void> loadTaks() async {
    _tasksList = await TaskModel.getAll();

    sordTaskList();

    notifyListeners();
  }

  double lineStatus(double width) {
    int currentWidth = 0;

    for (var task in _tasksList) {
      if (task.isActive == true) currentWidth++;
    }

    double widthStatus = _tasksList.length / currentWidth;

    return currentWidth == 0 ? 0 : width / widthStatus;
  }

  String capitalize(String s) => toBeginningOfSentenceCase(s);

  // Sord List

  void sordTaskList() {
    if (_periodicityIndex == 0 && _categoryIndex == 0) {
      _tasksList = tasksList
          .where((e) =>
              e.category == TaskCategory.work &&
              e.type == PeriodicityType.daily)
          .toList();
    }

    if (_periodicityIndex == 1 && _categoryIndex == 0) {
      _tasksList = tasksList
          .where((e) =>
              e.category == TaskCategory.work &&
              e.type == PeriodicityType.weekly)
          .toList();
    }

    if (_periodicityIndex == 0 && _categoryIndex == 1) {
      _tasksList = tasksList
          .where((e) =>
              e.category == TaskCategory.meetings &&
              e.type == PeriodicityType.daily)
          .toList();
    }

    if (_periodicityIndex == 1 && _categoryIndex == 1) {
      _tasksList = tasksList
          .where((e) =>
              e.category == TaskCategory.meetings &&
              e.type == PeriodicityType.weekly)
          .toList();
    }

    if (_periodicityIndex == 0 && _categoryIndex == 2) {
      _tasksList = tasksList
          .where((e) =>
              e.category == TaskCategory.home &&
              e.type == PeriodicityType.daily)
          .toList();
    }

    if (_periodicityIndex == 1 && _categoryIndex == 2) {
      _tasksList = tasksList
          .where((e) =>
              e.category == TaskCategory.home &&
              e.type == PeriodicityType.weekly)
          .toList();
    }

    notifyListeners();
  }
}
