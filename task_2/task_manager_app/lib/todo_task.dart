import 'package:flutter/material.dart';
import 'todo_page.dart';

class TodoTask extends StatelessWidget {
  const TodoTask({super.key});

  void showToDoTask(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TodoPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showToDoTask(context);
      },
      tooltip: "to do tasks",
      icon: const Icon(Icons.task, color: Colors.deepOrange),
    );
  }
}
