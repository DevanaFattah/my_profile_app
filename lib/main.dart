import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_profile_app/utils/user_preferences.dart';
import 'package:my_profile_app/models/user.dart';
import 'package:my_profile_app/pages/profile_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    final User user = UserPreferences.myUser;

    return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Colors.blue.shade300, dividerColor: Colors.black),
          title: title,
          home: ProfilePage(),
        );
  }
}
