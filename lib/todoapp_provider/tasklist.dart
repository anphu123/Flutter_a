import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/todoapp_provider/task_state.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskState>().tasks;

    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];

          // Format ngày tháng
          String deadlineText = task.deadline != null
              ? 'Thời hạn: ${DateFormat('dd/MM/yyyy').format(task.deadline!)}'
              : 'Không có thời hạn';

          // Format giờ (Nếu task.time != null)
          String timeText = task.time != null
              ? ' | Giờ: ${task.time!.format(context)}' // ✅ Sử dụng format(context)
              : '';

          return ListTile(
            title: Text(task.name),
            subtitle: Text('$deadlineText $timeText'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Logic chỉnh sửa
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    context.read<TaskState>().removeTask(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
