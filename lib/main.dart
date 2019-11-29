import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ui/pages/food.dart';
import 'package:food_ui/pages/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          accentColor: Color.fromRGBO(237, 92, 21, 1),
          accentColorBrightness: Brightness.light),
      initialRoute: '/',
      routes: {Search.id: (context) => Search(), Food.id: (context) => Food()},
    );
  }
}
