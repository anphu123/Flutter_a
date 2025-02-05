import 'package:flutter/material.dart';
import 'taskinput.dart';
import 'tasklist.dart';

class TaskListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh Sách Công Việc'),
      ),
      body: Column(
        children: [
          TaskInput(),
          TaskList(),
        ],
      ),
    );
  }
}