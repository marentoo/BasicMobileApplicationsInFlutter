import 'package:flutter/material.dart';

class TaskControls extends StatelessWidget {
  final void Function() addTask;
  final void Function() reset;
  final void Function(String) selectTaskType;
  final String selectedType;
  final List<String> taskTypes;

  const TaskControls({
    Key? key,
    required this.addTask,
    required this.reset,
    required this.selectTaskType,
    required this.selectedType,
    required this.taskTypes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PopupMenuButton<String>(
            onSelected: selectTaskType,
            itemBuilder: (BuildContext context) {
              return taskTypes.map((String taskType) {
                return PopupMenuItem<String>(
                  value: taskType,
                  child: Text(
                    taskType,
                  ),
                );
              }).toList();
            },
            child: ListTile(
              title: Text(selectedType),
              trailing: const Icon(Icons.arrow_drop_down),
            ),
          ),
          FloatingActionButton(
            onPressed: addTask,
            child: const Text(
              '+',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: reset,
            child: const Text('Reset list',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
