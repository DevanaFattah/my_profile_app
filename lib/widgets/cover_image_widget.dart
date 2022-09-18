import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  final double coverHeight = 280;

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.blue.shade300,
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/beach.jpg',
              width: double.infinity,
              height: coverHeight,
              fit: BoxFit.cover
            ),
          ],
        ),
      );
}
