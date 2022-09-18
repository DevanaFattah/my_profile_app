import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_profile_app/widgets/appbar_widget.dart';
import 'package:my_profile_app/utils/user_preferences.dart';
import 'package:my_profile_app/widgets/profile_widget.dart';
import 'package:my_profile_app/widgets/button_widget.dart';
import 'package:my_profile_app/widgets/numbers_widget.dart';
import 'package:my_profile_app/widgets/icon_button_widget.dart';
import 'package:my_profile_app/widgets/cover_image_widget.dart';
import 'package:my_profile_app/models/user.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CoverImage(),
              Positioned(
                bottom: -75,
                right: 180,
                child: ProfileWidget(
                  imagePath: user.imagePath,
                  onClicked: () async {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 105),
          buildName(user),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildSocialButton(FontAwesomeIcons.instagram),
              buildSocialButton(FontAwesomeIcons.github),
              buildSocialButton(FontAwesomeIcons.facebook),
            ],
          ),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  Widget buildSocialButton(IconData icon) => IconButtonWidget(
        icon: icon,
        onClicked: () {},
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: "Upgrade To Pro",
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('About',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
