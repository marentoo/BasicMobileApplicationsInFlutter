import 'package:flutter/material.dart';
import 'package:task_manager_app/task_input_list.dart';

class Sliders extends StatelessWidget {
  final Map<String, String> task;
  final Function(int) removeTask;
  final Function(int) setTaskDone;
  final int index;

  const Sliders({
    Key? key,
    required this.task,
    required this.removeTask,
    required this.setTaskDone,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task['title']!),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          removeTask(index);
        } else {
          setTaskDone(index);
        }
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
      ),
      secondaryBackground: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
      ),
      child: ListTile(
        title: TaskInputList(task: task),
        subtitle: Text(task['type']!),
      ),
    );
  }
}
