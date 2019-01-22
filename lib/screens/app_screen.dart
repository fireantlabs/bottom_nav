import 'package:bottom_nav/tabs/account_tab.dart';
import 'package:bottom_nav/tabs/home_tab.dart';
import 'package:bottom_nav/tabs/search_tab.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  PageController pageController;
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          HomeTab(
            key: Key('homeTab'),
          ),
          SearchTab(
            key: Key('searchTab'),
          ),
          AccountTab(
            key: Key('accountTab'),
          )
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Trang chủ"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text("Tìm kiếm"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text("Thành viên"),
        )
      ],
          onTap: onTap,
          currentIndex: page
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    pageController = new PageController(initialPage: this.page);
    super.initState();
  }
  void onTap(int index){
    pageController.animateToPage(
        index, duration: const Duration(milliseconds: 300),
        curve: Curves.ease);
  }
  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }
}
