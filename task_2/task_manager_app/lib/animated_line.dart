import 'package:flutter/material.dart';

class AnimatedLine extends StatefulWidget {
  @override
  _AnimatedLineState createState() => _AnimatedLineState();
}

class _AnimatedLineState extends State<AnimatedLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown,
        border: Border(
          bottom: BorderSide(
            color: Colors.brown,
            width: MediaQuery.of(context).size.width * 0.03,
          ),
        ),
      ),
    );
  }
}
