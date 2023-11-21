import 'package:flutter/material.dart';

class MeetingPage extends StatelessWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting Page'),
      ),
      body: const Center(
        child: Text(
            'Description: This page is dedicated to view list of meetings that were added'),
      ),
    );
  }
}
