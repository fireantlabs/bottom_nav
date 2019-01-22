import 'package:bottom_nav/models/data.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

//https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit

class _HomeTabState extends State<HomeTab> {
  List<Data> dataList = [
    Data(1, false, "Example-1"),
    Data(2, false, "Example-2"),
    Data(3, false, "Example-3"),
    Data(4, false, "Example-4"),
    Data(5, false, "Example-5"),
    Data(6, false, "Example-6"),
    Data(7, false, "Example-7"),
    Data(8, false, "Example-8"),
    Data(9, false, "Example-9"),
    Data(10, false, "Example-10"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (_, index) {
      return ExpansionTile(
        key: PageStorageKey('${dataList[index].id}'),
        title: Text(dataList[index].title),
        children: <Widget>[
          Container(
            color: index % 2 == 0 ? Colors.orange : Colors.limeAccent,
            height: 100.0,
          ),
        ],
      );
    });
  }
}
