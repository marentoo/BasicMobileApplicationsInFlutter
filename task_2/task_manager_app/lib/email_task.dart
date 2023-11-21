import 'package:flutter/material.dart';
import 'package:task_manager_app/email_page.dart';

class EmailTask extends StatelessWidget {
  // final List<Map<String, String>> tasks;

  const EmailTask({Key? key});

  void showEmailTask(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmailPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showEmailTask(context);
      },
      tooltip: "tasks - Email",
      icon: const Icon(Icons.email, color: Colors.deepOrange),
    );
  }
}
