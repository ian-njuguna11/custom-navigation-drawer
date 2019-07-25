import 'package:flutter/material.dart';
import '../navigation-drawer.dart';

class StatsScreen extends StatelessWidget {
  static final String routeName = "/stats";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text('Stats'),
      ),
      drawer: NavigationDrawer(),
      body: Container(
        color: theme.primaryColor,
        child: Center(
          child: Text(
            'Home',
          ),
        ),
      ),
    );
  }
}
