import 'Style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Views/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(scaffoldBackgroundColor: ThemeColors.lightTheme),
      darkTheme: ThemeData(scaffoldBackgroundColor: ThemeColors.darkTheme),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      title: "Calculator",
    );
  }
}
