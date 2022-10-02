import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final double horizontal;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    this.horizontal = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: StadiumBorder(),
      foregroundColor: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: 12,
      ),
    ),
    child: Text(text),
    onPressed: onClicked,
  );
}