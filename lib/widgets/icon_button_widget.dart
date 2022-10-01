import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onClicked;
  final Uri url;

  const IconButtonWidget({
    Key? key,
    required this.icon,
    required this.onClicked,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            shape: CircleBorder(),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40)),
        onPressed: onClicked,
        child: Icon(
          icon,
        ),
      );
}
