import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;
  final bool isEdit;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
    this.isEdit = false
  }) : super(key: key);

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
              buildImage('assets/images/saya.jpg'),
              Positioned(
                bottom: 0,
                right: 4,
                child: buildEditIcon(color) ,
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget buildImage(String path) {
    final image = AssetImage(path);

    return buildCircle(
        color: Colors.white,
        all: 4,
        child: ClipOval(
          child: Material(
            color: Colors.transparent,
            child: Ink.image(
                image: image,
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
