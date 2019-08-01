import 'package:flutter/material.dart';
import 'navigation-drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({this.screenName});
  final String screenName;
  static final NavigationDrawer drawer = NavigationDrawer();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      drawer: drawer,
      appBar: AppBar(
        backgroundColor: theme.secondaryHeaderColor,
        title: Text(
          'audible',
          style: theme.textTheme.title.copyWith(color: Colors.white),
        ),
        leading: Builder(
          builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),
      ),
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
