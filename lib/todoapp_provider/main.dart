import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/todoapp_provider/tasklistapp.dart';

import 'task_state.dart'; // Import lớp TaskState

void main() {
  runApp(
    ChangeNotifierProvider( // Cung cấp TaskState cho ứng dụng
      create: (context) => TaskState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskListApp(),
    );
  }
}




