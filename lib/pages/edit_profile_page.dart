import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_profile_app/widgets/appbar_widget.dart';
import 'package:my_profile_app/utils/user_preferences.dart';
import 'package:my_profile_app/widgets/profile_widget.dart';
import 'package:my_profile_app/widgets/button_widget.dart';
import 'package:my_profile_app/widgets/cover_image_widget.dart';
import 'package:my_profile_app/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:my_profile_app/widgets/text_field_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) {
    User user = UserPreferences.getUser();

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CoverImage(),
              ),
              Transform.translate(
                offset: const Offset(0, -50),
                child: ProfileWidget(
                    user: user,
                    isEdit: true,
                    onClicked: () async {
                      try {
                        final image = await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                        );

                        if (image == null) return;

                        final Directory directory =
                            await getApplicationDocumentsDirectory();
                        final name = basename(image.path);
                        final imageFile = File('${directory.path}/$name');
                        final newImage =
                            await File(image.path).copy(imageFile.path);

                        setState(
                          () => user = user.clone(imagePath: newImage.path),
                        );
                      } catch (err) {
                        print('err : $err');
                      }
                    }),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    TextFieldWidget(
                      label: 'Name',
                      text: user.name,
                      onChanged: (name) => user = user.clone(name: name),
                    ),
                    const SizedBox(height: 30),
                    TextFieldWidget(
                      label: 'Email',
                      text: user.email,
                      onChanged: (email) => user = user.clone(email: email),
                    ),
                    const SizedBox(height: 30),
                    TextFieldWidget(
                      label: 'About',
                      text: user.about,
                      maxLine: 5,
                      onChanged: (about) => user = user.clone(about: about),
                    ),
                    const SizedBox(height: 24),
                    ButtonWidget(
                      text: 'Simpan',
                      horizontal: 185,
                      vertical: 15,
                      onClicked: () {
                        UserPreferences.setUser(user);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
