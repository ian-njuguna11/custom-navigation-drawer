import 'package:flutter/material.dart';
import '../navigation-drawer.dart';

class StoreScreen extends StatelessWidget {
  static final String routeName = "/store";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text('Store'),
      ),
      drawer: NavigationDrawer(),
      body: Container(
        color: theme.primaryColor,
        child: Center(
          child: Text(
            'Store',
          ),
        ),
      ),
    );
  }
}