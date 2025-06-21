import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../task.dart';

class TaskService {
  static const String _tasksKey = 'tasks';

  Future<List<Task>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getStringList(_tasksKey) ?? [];
    return tasksJson.map((json) => Task.fromJson(jsonDecode(json))).toList();
  }

  Future<void> addTask(Task task) async {
    final prefs = await SharedPreferences.getInstance();
    final tasks = await getTasks();
    tasks.add(task);
    await prefs.setStringList(
      _tasksKey,
      tasks.map((t) => jsonEncode(t.toJson())).toList(),
    );
  }

  Future<void> updateTask(Task updatedTask) async {
    final prefs = await SharedPreferences.getInstance();
    final tasks = await getTasks();
    final index = tasks.indexWhere((t) => t.id == updatedTask.id);
    if (index != -1) {
      tasks[index] = updatedTask;
      await prefs.setStringList(
        _tasksKey,
        tasks.map((t) => jsonEncode(t.toJson())).toList(),
      );
    }
  }

  Future<void> deleteTask(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final tasks = await getTasks();
    tasks.removeWhere((t) => t.id == id);
    await prefs.setStringList(
      _tasksKey,
      tasks.map((t) => jsonEncode(t.toJson())).toList(),
    );
  }
}