import 'package:flutter/material.dart';
import 'package:audible_mockapp/home.dart';

class NavigationDrawer extends StatefulWidget {

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  /// Default selected item: Home
  static String selectedItem = 'Home';
  static int totStoreDropdownItems = 0;

  /// Default store dropdown menu: Closed (Icons.keyboard_arrow_up)
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

    Widget drawerHeader = Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(24.0, 24.0, 12.0, 24.0),
              child: CircleAvatar(
                radius: 32.0,
                backgroundColor: appTheme.secondaryHeaderColor,
                child: Text(
                  'NJ',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Nick Jensen', style: TextStyle(fontWeight: FontWeight.bold),),
                Text(
                  'nickjensen098@gmail.com',
                  style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),
                ),
                SizedBox(height: 8.0),
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0)),
                      child: Container(
                        width: 100.0,
                        height: 15.0,
                        color: Colors.blue[800],
                      ),
                    ),
                    Container(
                      width: 150.0,
                      height: 15.0,
                      child: Center(
                        child: Text('Novice'),
                      ),
                    ),
                  ],
                ),
                Text(
                  '23 hrs to go',
                  style: TextStyle(fontSize: 10.0),
                )
              ],
            ),
          ],
        ),
      ),
    );

    Widget drawerItem(IconData icon, String title) {
      ThemeData itemTheme;
      double itemHeight = 48.0;
      Color iconColor;

      /// Update the status indicator of the selected drawer item
      selectedItem == title
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
      if (selectedItem == title && selectedItem == "Home") {
        iconColor = appTheme.accentColor;
      } else if (selectedItem == title) {
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
            selectedItem = title;
            // Close the NavigationDrawer
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(
                      screenName: title,
                    ),
              ),
            );
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
                            padding:
                                const EdgeInsets.only(top: 12.0, right: 4.0),
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
                return FlatButton(
                  color: itemTheme.primaryColor,
                  onPressed: () {
                    setState(() {
                      selectedItem = storeDropdownItems[index];
                      // Release the NavigationDrawer
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                screenName: storeDropdownItems[index],
                              ),
                        ),
                      );
                    });
                  },
                  child: Container(
                    height: itemHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        itemStatusIndicator,
                        SizedBox(width: 58.0),
                        Text(
                          storeDropdownItems[index],
                          style: itemTextStyle,
                        )
                      ],
                    ),
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
      drawerItem(Icons.home, 'Home'),
      drawerItem(Icons.library_books, 'Library'),
      drawerItem(Icons.add_to_queue, 'News'),
      drawerItem(Icons.score, 'Stats'),
      Divider(color: appTheme.textSelectionColor),
      drawerItem(Icons.thumb_up, 'Recommended'),
      drawerItem(Icons.shopping_cart, 'Store'),
      Divider(color: appTheme.textSelectionColor),
      drawerItem(Icons.settings, 'Settings'),
      drawerItem(Icons.help, 'Help & Support'),
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
