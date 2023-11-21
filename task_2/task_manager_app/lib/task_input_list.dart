import 'package:flutter/material.dart';
import 'package:task_manager_app/email_task.dart';
import 'package:task_manager_app/meeting_task.dart';
import 'package:task_manager_app/phonecall_task.dart';
import 'package:task_manager_app/todo_task.dart';

class TaskInputList extends StatefulWidget {
  final Map<String, String> task;

  const TaskInputList({super.key, required this.task});

  @override
  TaskInputListState createState() => TaskInputListState();
}

class TaskInputListState extends State<TaskInputList> {
  final Map<String, Widget> _taskWidgets = {
    'email': const EmailTask(),
    'todo': const TodoTask(),
    'meeting': const MeetingTask(),
    'phone': const PhonecallTask(),
  };
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Enter title',
            ),
            controller: TextEditingController(text: widget.task['title']),
            onSubmitted: (value) {
              setState(() {
                widget.task['title'] = value;
              });
            },
          ),
        ),
        SizedBox(
          width: 100,
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter due date',
            ),
            controller: TextEditingController(text: widget.task['due date']),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                setState(() {
                  widget.task['due date'] =
                      pickedDate.toString().substring(0, 10);
                });
              }
            },
          ),
        ),
        SizedBox(
          width: 100,
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              hintText: 'Status',
            ),
            value: widget.task['Status'],
            onChanged: (value) =>
                setState(() => widget.task['Status'] = value!),
            items: const [
              DropdownMenuItem(value: 'done', child: Text('Done')),
              DropdownMenuItem(value: 'not done', child: Text('Not done')),
            ],
          ),
        ),
        SizedBox(
          width: 200,
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Enter Description',
            ),
            controller: TextEditingController(text: widget.task['Description']),
            onSubmitted: (value) {
              setState(() {
                widget.task['Description'] = value;
              });
            },
          ),
        ),
        SizedBox(
          width: 100,
          child: _taskWidgets[widget.task['type']!],
        ),
      ],
    );
  }
}
