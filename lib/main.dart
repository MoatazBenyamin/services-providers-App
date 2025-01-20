import 'package:Mob_Project/Home/presentation/pages/main_home.dart';
import 'package:Mob_Project/login/presentation/pages/login.dart';
import 'package:Mob_Project/search/presentation/pages/Search.dart';
import 'package:Mob_Project/signUp/presentation/pages/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/colorsPallete.dart';
import 'core/dependency_injiction.dart' as di;

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  di.signUpInit();
  di.logInInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          sharedPref.getString("companyid") == null ? "signup" : "home",
      routes: {
        "login": (context) => Login(),
        "signup": (context) => SignUp(),
        "home": (context) => MainHome(),
        "search":(context) => SearchCompanies(),
      },
      theme: ThemeData(
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.black,
              onPrimary: Color.fromRGBO(255, 255, 255, 1),
              secondary: Colors.amber,
              onSecondary: Colors.amber,
              error: Colors.red,
              onError: Colors.red,
              background: Darkblue,
              onBackground: Darkblue,
              surface: Darkblue,
              onSurface: Colors.black)),
      home: SafeArea(child: MainHome()),
    );
  }
}
