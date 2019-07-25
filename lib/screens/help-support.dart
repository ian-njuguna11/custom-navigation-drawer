import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  static final String routeName = "/help-support";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text('Help & Support'),
      ),
      body: Container(
        color: theme.primaryColor,
        child: Center(
          child: Text(
            'Help & Support',
          ),
        ),
      ),
    );
  }
}
