import 'package:flutter/material.dart';
import 'screens/library.dart';
import 'screens/news.dart';
import 'screens/stats.dart';
import 'screens/recommended.dart';
import 'screens/store.dart';
import 'screens/settings.dart';
import 'screens/help-support.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  /// Selected default item: Home
  static String selectedItem = "/";

  Drawer getNavDrawer(BuildContext context) {
    var theme = Theme.of(context);

    Widget headerChild = Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hi, User',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text('user007@bond.com'),
        ],
      ),
    );

    Widget _getNavItem(IconData icon, String title, String routeName) {
      ThemeData tileTheme;
      Color iconTheme;

      selectedItem == routeName
          ? tileTheme = theme
          : tileTheme = ThemeData(
              primaryColor: theme.primaryColor,
              accentColor: theme.primaryColor,
              textSelectionColor: Colors.grey[700],
            );

      if (selectedItem == routeName && selectedItem == "/") {
        iconTheme = Colors.orange;
      } else if (selectedItem == routeName) {
        iconTheme = Colors.white;
      } else {
        iconTheme = Colors.grey[700];
      }

      return FlatButton(
          color: tileTheme.primaryColor,
          padding: EdgeInsets.all(0.0),
          onPressed: () {
            setState(() {
              // pop closes the drawer
              Navigator.of(context).pop();
              selectedItem = routeName;
              print(selectedItem);
              // navigate to the route
              Navigator.of(context).pushNamed(routeName);
            });
          },
          child: Container(
            height: 48.0,
            color: tileTheme.primaryColor,
            child: Row(
              children: <Widget>[
                Container(
                  height: 44.0,
                  width: 4.0,
                  color: tileTheme.accentColor,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Icon(
                  icon,
                  color: iconTheme,
                ),
                SizedBox(
                  width: 24.0,
                ),
                Text(
                  title,
                  style: TextStyle(color: tileTheme.textSelectionColor),
                ),
              ],
            ),
          ));
    }

    var myNavChildren = [
      headerChild,
      _getNavItem(Icons.home, "Home", "/"),
      _getNavItem(Icons.library_books, "Library", LibraryScreen.routeName),
      _getNavItem(Icons.add_to_queue, "News", NewsScreen.routeName),
      _getNavItem(Icons.score, "Stats", StatsScreen.routeName),
      Divider(
        color: theme.textSelectionColor,
      ),
      _getNavItem(Icons.thumb_up, "Recommended", RecommendedScreen.routeName),
      _getNavItem(Icons.shopping_cart, "Store", StoreScreen.routeName),
      Divider(
        color: theme.textSelectionColor,
      ),
      _getNavItem(Icons.settings, "Settings", SettingsScreen.routeName),
      _getNavItem(Icons.help, "Help & Support", HelpSupportScreen.routeName),
    ];

    ListView listView = new ListView(
      children: myNavChildren,
    );

    return new Drawer(
      child: Container(color: theme.primaryColor, child: listView),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getNavDrawer(context);
  }
}
