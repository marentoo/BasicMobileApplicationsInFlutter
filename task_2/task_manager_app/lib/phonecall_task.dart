import 'package:flutter/material.dart';
import 'phonecall_page.dart';

class PhonecallTask extends StatelessWidget {
  const PhonecallTask({super.key});

  void showPhonecallTask(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PhonecallPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showPhonecallTask(context);
      },
      tooltip: "task - future phone call",
      icon: const Icon(Icons.phone, color: Colors.deepOrange),
    );
  }
}
