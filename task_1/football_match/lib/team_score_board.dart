import 'package:flutter/material.dart';

class TeamScoreBoard extends StatefulWidget {
  final String teamName;

  const TeamScoreBoard({super.key, required this.teamName});

  @override
  State<StatefulWidget> createState() {
    return _TeamScoreBoardState();
  }
}

class _TeamScoreBoardState extends State<TeamScoreBoard> {
  int score = 0;

  void _incrementCounter() {
    setState(() {
      score++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (score > 0) {
        score--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.teamName,
          style: TextStyle(fontSize: 25),
        ),
        Text(
          score.toString(),
          style: TextStyle(fontSize: 25),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: _incrementCounter,
                icon: const Icon(Icons.sports_soccer)),
            IconButton(
                onPressed: _decrementCounter, icon: const Icon(Icons.remove))
          ],
        )
      ],
    );
  }
}
