import 'package:complex_ui_app_1/main_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(brightness: Brightness.dark), home: MainPage());
  }
}
