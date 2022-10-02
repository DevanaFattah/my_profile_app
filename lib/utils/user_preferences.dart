import 'package:my_profile_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';

  static const myUser = User(
    imagePath:
        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
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
