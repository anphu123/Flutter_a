import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/todoapp_provider/task_state.dart';
import 'package:intl/intl.dart';

class TaskInput extends StatefulWidget {
  @override
  _TaskInputState createState() => _TaskInputState();
  
}

void _showErrorDialog(String message) {
  var context;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Thông báo'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Đóng'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}



class _TaskInputState extends State<TaskInput> {
  final TextEditingController _controller = TextEditingController();
  DateTime? _selectedDeadline;
  TimeOfDay? _selectedTime;

  // ... (keep the _showErrorDialog method as is)

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Nhập công việc...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.task),
              ),
            ),
            SizedBox(height: 16),
            OutlinedButton.icon(
              icon: Icon(Icons.calendar_today),
              label: Text(
                _selectedDeadline == null
                    ? 'Chọn thời hạn'
                    : 'Thời hạn: ${DateFormat('dd/MM/yyyy').format(_selectedDeadline!)}',
              ),
              onPressed: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDeadline ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (picked != null) {
                  setState(() {
                    _selectedDeadline = picked;
                  });
                }
              },
            ),
            SizedBox(height: 8),
            OutlinedButton.icon(
              icon: Icon(Icons.access_time_rounded),
              label: Text(
                _selectedTime == null
                    ? 'Chọn giờ'
                    : 'Giờ: ${_selectedTime!.format(context)}',
              ),
              onPressed: () async {
                TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: _selectedTime ?? TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() {
                    _selectedTime = picked;
                  });
                }
              },
            ),
            SizedBox(height: 16),
            Text(
              _selectedDeadline != null && _selectedTime != null
                  ? 'Thời hạn đã chọn: ${DateFormat('dd/MM/yyyy').format(_selectedDeadline!)} ${_selectedTime!.format(context)}'
                  : 'Chưa chọn thời hạn và giờ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Thêm'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              onPressed: () {
                final String task = _controller.text;
                if (task.isEmpty || _selectedDeadline == null || _selectedTime == null) {
                  _showErrorDialog('Vui lòng nhập đầy đủ thông tin công việc, thời hạn và giờ.');
                } else {
                  final DateTime fullDeadline = DateTime(
                    _selectedDeadline!.year,
                    _selectedDeadline!.month,
                    _selectedDeadline!.day,
                    _selectedTime!.hour,
                    _selectedTime!.minute,
                  );
                  context.read<TaskState>().addTask(task, deadline: fullDeadline);
                  _controller.clear();
                  setState(() {
                    _selectedDeadline = null;
                    _selectedTime = null;
                  });
                }

              },
            ),
          ],
        ),
      ),
    );
  }
}