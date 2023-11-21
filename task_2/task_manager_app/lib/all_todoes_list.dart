import 'package:flutter/material.dart';
import 'package:task_manager_app/sliders.dart';
import 'package:task_manager_app/task_controls.dart';

class AllTodoesList extends StatefulWidget {
  const AllTodoesList({Key? key}) : super(key: key);

  @override
  AllTodoesListState createState() => AllTodoesListState();
}

class AllTodoesListState extends State<AllTodoesList> {
  final List<Map<String, String>> tasks = [];
  String _selectedType = 'Select type of task and click +';

  final List<String> _taskTypes = ['email', 'todo', 'meeting', 'phone'];

  void addTask() {
    if (_selectedType == 'Select type of task and click +') {
      return;
    }
    setState(() {
      tasks.add({
        "title": "",
        "type": _selectedType,
        "due date": "",
        "Status": "not done",
        "Description": "",
      });
    });
  }

  void reset() {
    setState(() {
      tasks.clear();
      _selectedType = 'Select type of task and click +';
    });
  }

  void selectTaskType(String taskType) {
    setState(() {
      _selectedType = taskType;
    });
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void setTaskDone(int index) {
    setState(() {
      tasks[index]['Status'] = 'done';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Task List',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.orangeAccent,
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              final task = tasks[index];
              return Sliders(
                task: task,
                removeTask: removeTask,
                setTaskDone: setTaskDone,
                index: index,
              );
            },
          ),
        ),
        TaskControls(
          addTask: addTask,
          reset: reset,
          selectTaskType: selectTaskType,
          selectedType: _selectedType,
          taskTypes: _taskTypes,
        ),
      ],
    );
  }
}
