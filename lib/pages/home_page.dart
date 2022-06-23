import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'calendar_page.dart';
import 'rack_page.dart';
import 'settings_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SideMenu(
              controller: page,
              // onDisplayModeChanged: (mode) {
              //   print(mode);
              // },
              style: SideMenuStyle(
                displayMode: SideMenuDisplayMode.auto,
                hoverColor: Colors.blue[100],
                selectedColor: Colors.lightBlue,
                selectedTitleTextStyle: const TextStyle(color: Colors.white),
                selectedIconColor: Colors.white,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.all(Radius.circular(10)),
                // ),
                // backgroundColor: Colors.blueGrey[700]
              ),
              title: Column(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 150,
                      maxWidth: 150,
                    ),
                    child: const Icon(Icons.home),
                  ),
                  const Divider(
                    indent: 8.0,
                    endIndent: 8.0,
                  ),
                ],
              ),
              footer: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'mohada',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              items: [
                SideMenuItem(
                  priority: 0,
                  title: 'Dashboard',
                  onTap: () {
                    page.jumpToPage(0);
                  },
                  icon: const Icon(Icons.home),
                  badgeContent: const Text(
                    '3',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SideMenuItem(
                  priority: 1,
                  title: 'Users',
                  onTap: () {
                    page.jumpToPage(1);
                  },
                  icon: const Icon(Icons.supervisor_account),
                ),
                SideMenuItem(
                  priority: 2,
                  title: 'Settings',
                  onTap: () {
                    page.jumpToPage(2);
                  },
                  icon: const Icon(Icons.settings),
                ),
                SideMenuItem(
                  priority: 6,
                  title: 'Exit',
                  onTap: () {
                    page.jumpToPage(5);
                  },
                  icon: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: page,
                children: [
                  CalendarPage(),
                  RackPage(),
                  SettingsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
