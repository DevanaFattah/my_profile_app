import 'package:my_profile_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';

  static const myUser = User(
    imagePath: 'assets/images/saya.jpg',
    name: 'Devana Fattah Afrenov',
    email: 'dafrenov@gmail.com',
    about: 'Just a student who is still exploring talents.',
    isDarkMode: false,
    instagramUrl: 'https://www.instagram.com/dvn_fattah',
    githubUrl: 'https://github.com/DevanaFattah',
    facebookUrl: 'https://www.facebook.com/DevanaFattah',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final String json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
