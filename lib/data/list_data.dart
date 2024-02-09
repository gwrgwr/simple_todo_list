import 'package:flutter/material.dart';

class TaskList extends InheritedWidget {
  TaskList({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<List<dynamic>> tasks = [];

  static TaskList of(BuildContext context) {
    final TaskList? result =
        context.dependOnInheritedWidgetOfExactType<TaskList>();
    assert(result != null, 'No TaskList found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskList oldWidget) {
    return oldWidget.tasks.length != tasks.length;
  }
}
