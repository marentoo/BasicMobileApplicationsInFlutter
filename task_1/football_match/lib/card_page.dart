import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  final Color color;

  const CardPage({super.key, required this.color});

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
          child: IconButton(
              onPressed: () {
                goBack(context);
              },
              icon: const Icon(Icons.exit_to_app_sharp),
              iconSize: 100)),
    );
  }
}
