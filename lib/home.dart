import 'package:flutter/material.dart';
import 'navigation-drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({this.screenName});
  final String screenName;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.secondaryHeaderColor,
        title: Text(
          'audible',
          style: theme.textTheme.title.copyWith(color: Colors.white),
        ),
      ),
      drawer: NavigationDrawer(),
      body: Container(
        color: theme.primaryColor,
        child: Center(
          child: Text(
            screenName + ' \nPlaceholder Screen',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
