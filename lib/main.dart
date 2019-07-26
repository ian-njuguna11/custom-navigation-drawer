import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/library.dart';
import 'screens/news.dart';
import 'screens/stats.dart';
import 'screens/recommended.dart';
import 'screens/store.dart';
import 'screens/settings.dart';
import 'screens/help-support.dart';

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
      home: HomeScreen(),
      // Start with building only 4 screens (actual no. of screens: 7)
      routes: <String, WidgetBuilder>{
        LibraryScreen.routeName: (BuildContext context) => LibraryScreen(),
        NewsScreen.routeName: (BuildContext context) => NewsScreen(),
        StatsScreen.routeName: (BuildContext context) => StatsScreen(),
        RecommendedScreen.routeName: (BuildContext context) =>
            RecommendedScreen(),
        StoreScreen.routeName: (BuildContext context) => StoreScreen(),
        SettingsScreen.routeName: (BuildContext context) => SettingsScreen(),
        HelpSupportScreen.routeName: (BuildContext context) => HelpSupportScreen(),
      },
    );
  }
}
