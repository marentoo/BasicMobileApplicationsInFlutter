import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Page'),
      ),
      body: const Center(
        child: Text(
            'Description: This page is dedicated to creating to do list.Organize your task, be productive and reach your goals. Please enter task below'),
      ),
    );
  }
}
