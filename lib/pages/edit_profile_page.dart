import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_profile_app/pages/profile_page.dart';
import 'package:my_profile_app/widgets/appbar_widget.dart';
import 'package:my_profile_app/utils/user_preferences.dart';
import 'package:my_profile_app/widgets/profile_widget.dart';
import 'package:my_profile_app/widgets/button_widget.dart';
import 'package:my_profile_app/widgets/numbers_widget.dart';
import 'package:my_profile_app/widgets/icon_button_widget.dart';
import 'package:my_profile_app/widgets/cover_image_widget.dart';
import 'package:my_profile_app/models/user.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_profile_app/widgets/text_field_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    User user = UserPreferences.myUser;

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
                    imagePath: '',
                    isEdit: true,
                    onClicked: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    }),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    TextFieldWidget(
                      label: 'Full name',
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
