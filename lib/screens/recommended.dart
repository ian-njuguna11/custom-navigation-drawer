import 'package:flutter/material.dart';
import '../navigation-drawer.dart';

class RecommendedScreen extends StatelessWidget {
  static final String routeName = "/recommended";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text('Recommended'),
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
