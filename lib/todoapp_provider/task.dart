import 'dart:developer';

import 'package:flutter/material.dart';

class Task {
  String name;
  DateTime? deadline;
  TimeOfDay? time;

  Task({required this.name, this.deadline, this.time});
}