import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<dynamic> _lists = [];
  List<dynamic> get lists => _lists;
  set lists(List<dynamic> value) {
    _lists = value;
  }

  void addToLists(dynamic value) {
    _lists.add(value);
  }

  void removeFromLists(dynamic value) {
    _lists.remove(value);
  }

  void removeAtIndexFromLists(int index) {
    _lists.removeAt(index);
  }

  void updateListsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _lists[index] = updateFn(_lists[index]);
  }

  void insertAtIndexInLists(int index, dynamic value) {
    _lists.insert(index, value);
  }

  List<dynamic> _tasks = [];
  List<dynamic> get tasks => _tasks;
  set tasks(List<dynamic> value) {
    _tasks = value;
  }

  void addToTasks(dynamic value) {
    _tasks.add(value);
  }

  void removeFromTasks(dynamic value) {
    _tasks.remove(value);
  }

  void removeAtIndexFromTasks(int index) {
    _tasks.removeAt(index);
  }

  void updateTasksAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _tasks[index] = updateFn(_tasks[index]);
  }

  void insertAtIndexInTasks(int index, dynamic value) {
    _tasks.insert(index, value);
  }
}
