import 'package:flutter/material.dart';
import 'package:audible_mockapp/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.grey,
              displayColor: Colors.white,
            ),
        // This colors the [InputOutlineBorder] when it is selected
        primaryColor: Color(0xFF1B1C1E),
        secondaryHeaderColor: Color(0xFF222325),
        accentColor: Color(0xFFF39826),
        textSelectionColor: Colors.white,
      ),
      title: 'Audible MockApp',
      home: HomeScreen(
        screenName: 'Home',
      ),
    );
  }
}
