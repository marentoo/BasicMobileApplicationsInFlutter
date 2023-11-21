import 'package:flutter/material.dart';
import 'package:football_match/card_page.dart';

class CardRow extends StatelessWidget {
  const CardRow({super.key});

  void showCardPage(BuildContext context, Color color) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CardPage(color: color)));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              showCardPage(context, Colors.red);
            },
            icon: const Icon(Icons.rectangle, color: Colors.red)),
        IconButton(
            onPressed: () {
              showCardPage(context, Colors.yellow);
            },
            icon: const Icon(Icons.rectangle, color: Colors.yellow)),
      ],
    );
  }
}
