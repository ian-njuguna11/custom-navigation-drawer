import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static final String routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text('Settings'),
      ),
      body: Container(
        color: theme.primaryColor,
        child: Center(
          child: Text(
            'Settings',
          ),
        ),
      ),
    );
  }
}
