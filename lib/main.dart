import 'package:flutter/material.dart';
import 'package:yukparkir/utils/components/constans.dart';
import 'package:yukparkir/views/controller/screen_controller.dart';
import 'package:yukparkir/views/login/login_page.dart';

void main() {
  runApp(const MainApplication());
}

class MainApplication extends StatelessWidget {
  const MainApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yuk Parkir !!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: ColorPallete.black,
          ),
          headline2: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: ColorPallete.black,
          ),
          headline3: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: ColorPallete.black,
          ),
          headline4: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: ColorPallete.black,
          ),
          headline5: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: ColorPallete.black,
          ),
          bodyText1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: ColorPallete.black,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: ColorPallete.black,
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
