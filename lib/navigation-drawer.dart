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
  /// Default selected item: Home ("/")
  static String selectedItem = "/";
  static int totStoreDropdownItems = 0;

  /// Default store dropdown menu: Closed
  static IconData storeDropdownIcon = Icons.keyboard_arrow_up;
  static final List<String> storeDropdownItems = [
    "Browse",
    "Wish List",
    "Categories",
    "Best Sellers",
    "New Releases",
    "My Pre-Orders",
    "Gift Center",
    "My Account",
  ];

  /// Provide a single controller to manage the scrolling for the Drawer()
  ScrollController controller = ScrollController();

  /// Custom navigation drawer as seen in the Audible book service application
  Drawer customNavigationDrawer(BuildContext context) {
    var appTheme = Theme.of(context);
    var appTextTheme = appTheme.textTheme;
    var headerStyle =
        appTextTheme.copyWith().title.copyWith(color: Colors.white);
    var subheadStyle =
        appTextTheme.copyWith().subhead.copyWith(color: Colors.grey);

    Widget drawerHeader = Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hi, Nick',
            style: headerStyle,
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            'nickjensen098@gmail.com',
            style: subheadStyle,
          ),
        ],
      ),
    );

    Widget drawerItem(IconData icon, String title, String routeName) {
      ThemeData itemTheme;
      double itemHeight = 48.0;
      Color iconColor;

      /// Update the status indicator of the selected drawer item
      selectedItem == routeName
          ? itemTheme = appTheme
          : itemTheme = ThemeData(
              primaryColor: appTheme.primaryColor,
              accentColor: appTheme.primaryColor,
              textSelectionColor: Colors.grey[700],
            );

      TextStyle itemTextStyle = appTextTheme
          .copyWith()
          .headline
          .copyWith(color: itemTheme.textSelectionColor, fontSize: 16.0);

      /// Highlight the currently selected drawerItem icon white,
      /// unless it is the home icon which should be highlighted orange,
      /// all other unselected drawerItem icons must be grey
      if (selectedItem == routeName && selectedItem == "/") {
        iconColor = appTheme.accentColor;
      } else if (selectedItem == routeName) {
        iconColor = appTheme.textSelectionColor;
      } else {
        iconColor = Colors.grey[700];
      }

      /// Toggle the selected items status indicator
      Widget itemStatusIndicator = Container(
        height: 44.0,
        width: 4.0,
        color: itemTheme.accentColor,
      );

      Widget buildDrawerItem = FlatButton(
        color: itemTheme.primaryColor,
        padding: EdgeInsets.all(0.0), //remove default padding from FlatButton
        onPressed: () {
          setState(() {
            selectedItem = routeName;
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(routeName);
          });
        },
        child: Container(
          height: itemHeight,
          color: itemTheme.primaryColor,
          child: Row(
            children: <Widget>[
              itemStatusIndicator,
              SizedBox(width: 10.0),
              Icon(
                icon,
                color: iconColor,
              ),
              SizedBox(width: 24.0),
              Text(
                title,
                style: itemTextStyle,
              ),
            ],
          ),
        ),
      );

      Widget buildDropdownDrawerItem = Column(
        children: <Widget>[
          FlatButton(
            color: itemTheme.primaryColor,
            padding: EdgeInsets.all(0.0),
            onPressed: () {
              setState(() {
                /// Toggle the state of the store dropdown menu items
                if (storeDropdownIcon == Icons.keyboard_arrow_up) {
                  storeDropdownIcon = Icons.keyboard_arrow_down;
                  totStoreDropdownItems = storeDropdownItems.length;
                } else {
                  storeDropdownIcon = Icons.keyboard_arrow_up;
                  totStoreDropdownItems = 0;
                }
              });
            },
            child: Container(
              height: itemHeight,
              color: itemTheme.primaryColor,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            itemStatusIndicator,
                            SizedBox(width: 10.0),
                            Icon(
                              icon,
                              color: iconColor,
                            ),
                            SizedBox(width: 24.0),
                            Text(
                              title,
                              style: itemTextStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0, right: 4.0),
                            child: Icon(
                              storeDropdownIcon,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
          Container(
            height: itemHeight * totStoreDropdownItems,
            child: ListView.builder(
              controller: controller,
              itemCount: totStoreDropdownItems,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: itemHeight,
                  color: itemTheme.primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 62.0),
                      Text(
                        storeDropdownItems[index],
                        style: itemTextStyle,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );

      /// Return the correct drawer item Widget
      if (title == "Store") {
        return buildDropdownDrawerItem;
      } else {
        return buildDrawerItem;
      }
    }

    /// Layout the custom navigation drawer
    var drawerItemWidgets = [
      drawerHeader,
      drawerItem(Icons.home, "Home", "/"),
      drawerItem(Icons.library_books, "Library", LibraryScreen.routeName),
      drawerItem(Icons.add_to_queue, "News", NewsScreen.routeName),
      drawerItem(Icons.score, "Stats", StatsScreen.routeName),
      Divider(color: appTheme.textSelectionColor),
      drawerItem(Icons.thumb_up, "Recommended", RecommendedScreen.routeName),
      drawerItem(Icons.shopping_cart, "Store", StoreScreen.routeName),
      Divider(color: appTheme.textSelectionColor),
      drawerItem(Icons.settings, "Settings", SettingsScreen.routeName),
      drawerItem(Icons.help, "Help & Support", HelpSupportScreen.routeName),
    ];

    ListView listView = ListView(
      children: drawerItemWidgets,
    );

    return Drawer(
      child: Container(
        color: appTheme.primaryColor,
        child: listView,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return customNavigationDrawer(context);
  }
}
