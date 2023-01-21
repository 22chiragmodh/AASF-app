import 'package:flutter/material.dart';

class TagSelector extends StatelessWidget {
  final String text;
  final Color color;

  const TagSelector({required this.text, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color),
    );
  }
}
