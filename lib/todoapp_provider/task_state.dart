import 'package:flutter/material.dart';
import 'package:untitled2/todoapp_provider/task.dart';

class TaskState extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  // 🆕 Thêm tham số `time`
  void addTask(String taskName, {DateTime? deadline, TimeOfDay? time}) {
    _tasks.add(Task(name: taskName, deadline: deadline, time: time));
    notifyListeners();
  }

  void removeTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
      notifyListeners();
    }
  }

  // 🆕 Sửa Task (Thêm time)
  void editTask(int index, String newName, {DateTime? newDeadline, TimeOfDay? newTime}) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index].name = newName;
      _tasks[index].deadline = newDeadline;
      _tasks[index].time = newTime;  // ✅ Thêm cập nhật time
      notifyListeners();
    }
  }

  // Kiểm tra deadline và thời gian
  void checkDeadlines(Duration notificationDuration) {
    DateTime now = DateTime.now();
    for (var task in _tasks) {
      if (task.deadline != null && task.deadline!.isBefore(now.add(notificationDuration))) {
        // Notify user about the upcoming deadline
        print('Reminder: Task "${task.name}" is due soon!');
      }
    }
  }
}
