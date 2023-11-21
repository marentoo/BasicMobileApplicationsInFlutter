import 'package:flutter/material.dart';
import 'package:task_manager_app/animated_line.dart';
import 'package:task_manager_app/all_todoes_list.dart';
import 'package:task_manager_app/meeting_task.dart';
import 'package:task_manager_app/phonecall_task.dart';
import 'package:task_manager_app/todo_task.dart';

import 'email_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Task Manager Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AnimatedLine(),
            const Text(
              'Task Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.orangeAccent,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                EmailTask(),
                TodoTask(),
                MeetingTask(),
                PhonecallTask(),
              ],
            ),
            AnimatedLine(),
            // const SizedBox(height: 10),
            const AllTodoesList(),
          ],
        ),
      ),
    );
  }
}
