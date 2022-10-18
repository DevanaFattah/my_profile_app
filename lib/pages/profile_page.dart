import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_profile_app/pages/edit_profile_page.dart';
import 'package:my_profile_app/widgets/appbar_widget.dart';
import 'package:my_profile_app/utils/user_preferences.dart';
import 'package:my_profile_app/widgets/profile_widget.dart';
import 'package:my_profile_app/widgets/button_widget.dart';
import 'package:my_profile_app/widgets/numbers_widget.dart';
import 'package:my_profile_app/widgets/icon_button_widget.dart';
import 'package:my_profile_app/widgets/cover_image_widget.dart';
import 'package:my_profile_app/models/user.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    User user = UserPreferences.getUser();

    return Scaffold(
      appBar: buildAppBar(
        context,
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
        ),
        child: ListView(
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
                      onClicked: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditProfilePage(),
                          ),
                        );
                        setState(() {});
                      }),
                ),
              ],
            ),
            buildName(user),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildSocialButton(
                  FontAwesomeIcons.instagram,
                  user.instagramUrl,
                ),
                buildSocialButton(
                  FontAwesomeIcons.github,
                  user.githubUrl,
                ),
                buildSocialButton(
                  FontAwesomeIcons.facebook,
                  user.facebookUrl,
                ),
              ],
            ),
            const SizedBox(height: 24),
            NumbersWidget(),
            const SizedBox(height: 48),
            buildAbout(user),
          ],
        ),
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

  Widget buildSocialButton(IconData icon, String url) => IconButtonWidget(
        icon: icon,
        url: Uri.parse(url),
        onClicked: () async {
          final Uri uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(
              uri,
              mode: LaunchMode.externalNonBrowserApplication,
              webViewConfiguration: const WebViewConfiguration(),
            );
          }
        },
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
