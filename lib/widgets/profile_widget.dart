import 'package:flutter/material.dart';
import 'package:my_profile_app/models/user.dart';
import 'dart:io';

class ProfileWidget extends StatelessWidget {
  final User user;
  final VoidCallback onClicked;
  final bool isEdit;

  const ProfileWidget(
      {Key? key,
      required this.user,
      required this.onClicked,
      this.isEdit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
        child: Stack(
      children: <Widget>[
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              buildImage(user.imagePath),
              Positioned(
                bottom: 0,
                right: 4,
                child: buildEditIcon(color),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget buildImage(String path) {
    final image = path.contains('assets')
        ? AssetImage(path)
        : FileImage(
            File(path),
          );

    return buildCircle(
        color: Colors.white,
        all: 4,
        child: ClipOval(
          child: Material(
            color: Colors.transparent,
            child: Ink.image(
                image: image as ImageProvider,
                fit: BoxFit.cover,
                width: 128,
                height: 128,
                child: InkWell(
                  onTap: onClicked,
                )),
          ),
        ));
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            isEdit ? Icons.add_a_photo_rounded : Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          color: color,
          padding: EdgeInsets.all(all),
          child: child,
        ),
      );
}
