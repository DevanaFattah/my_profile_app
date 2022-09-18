import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButton(context, 'XII RPL B', 'Kelas'),
              buildDivider(),
              buildButton(context, '10', 'Absen'),
              buildDivider(),
              buildButton(context, 'Reno', 'Nickname'),
            ],
          ),
        ),
      );

  Widget buildDivider() => Container(
        height: 24,
        child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ],
        ),
      );
}
