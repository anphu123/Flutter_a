import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class TaskInput extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Nhập công việc...',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final String task = _controller.text;
              if (task.isNotEmpty) {
                context.read<TaskState>().addTask(task);
                _controller.clear();
              }
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskState>().tasks;

    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<TaskState>().removeTask(index);
              },
            ),
          );
        },
      ),
    );
  }
}
