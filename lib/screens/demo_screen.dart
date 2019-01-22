import 'package:flutter/material.dart';
import 'package:bottom_nav/tabs/account_tab.dart';
import 'package:bottom_nav/tabs/home_tab.dart';
import 'package:bottom_nav/tabs/search_tab.dart';

class DemoScreen extends StatefulWidget {
  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Appbar"),
      ),
      body: Stack(
        children: <Widget>[
          Offstage(
            offstage: _currentIndex != 0,
            child: HomeTab(
              key: Key('homeKey'),
            ),
          ),
          Offstage(
            offstage: _currentIndex != 1,
            child: SearchTab(
              key: Key('searchKey'),
            ),
          ),
          Offstage(
            offstage: _currentIndex != 2,
            child: AccountTab(
              key: Key('accountKey'),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text('Trang chủ')),
          BottomNavigationBarItem(
              icon: new Icon(Icons.search), title: new Text('Tìm kiếm')),
          BottomNavigationBarItem(
              icon: new Icon(Icons.person), title: new Text('Thành viên')),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
