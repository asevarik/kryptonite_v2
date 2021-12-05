// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:kryptonite/providers/provider.dart';
import 'package:kryptonite/themes/light_theme_data.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: Kryptonite(),
      create: (context) => PasswordData(),
    );
  }
}

class Kryptonite extends StatelessWidget {
  const Kryptonite({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightThemeData(),
      home: HomeScreen(),
    );
  }
}
