import 'package:flutter/material.dart';
import 'meeting_page.dart';

class MeetingTask extends StatelessWidget {
  const MeetingTask({super.key});

  void showMeetingTask(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MeetingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showMeetingTask(context);
      },
      tooltip: "tasks - meetings",
      icon: const Icon(Icons.people, color: Colors.deepOrange),
    );
  }
}
