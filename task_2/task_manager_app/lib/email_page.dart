import 'package:flutter/material.dart';

class EmailPage extends StatelessWidget {
  // final List<Map<String, String>>? tasks;

  const EmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Page'),
      ),
      body: Column(
        children: [
          const Text(
            'Description: This page is dedicated to creating emails in fast and easy way. Enter who you want to reach, topic, message you want to deliver and send it!',
          ),
          const SizedBox(height: 20),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: tasks?.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       final task = tasks![index];
          //       return ListTile(
          //         title: Text(task['title']!),
          //         subtitle: Text(task['Description']!),
          //         trailing: Text(task['Status']!),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
