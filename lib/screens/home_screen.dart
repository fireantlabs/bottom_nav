import 'package:bottom_nav/tabs/home_tab.dart';
import 'package:bottom_nav/tabs/search_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Key keyHome = PageStorageKey('tabHome');
  final Key keySearch = PageStorageKey('tabSearch');
  final PageStorageBucket bucket = PageStorageBucket();
  int currentTab = 0;

  HomeTab home;
  SearchTab search;

  List<Widget> tabs;
  Widget currentTabWidget;

  @override
  void initState() {
    // TODO: implement initState
    home = HomeTab(
      key: keyHome,
    );
    search = SearchTab(
      key: keySearch,
    );

    tabs = [home, search];

    currentTabWidget = home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation"),
      ),
      body: PageStorage(bucket: bucket, child: currentTabWidget),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
            currentTabWidget = tabs[index];
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ],
      ),
    );
  }
}
