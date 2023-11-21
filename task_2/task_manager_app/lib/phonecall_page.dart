import 'package:flutter/material.dart';

class PhonecallPage extends StatelessWidget {
  const PhonecallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone call page'),
      ),
      body: const Center(
        child: Text(
            'Description: This is phone call task page. It contains all tasks related to calling somebody'),
      ),
    );
  }
}
