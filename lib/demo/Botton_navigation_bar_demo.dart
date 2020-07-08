import 'package:flutter/material.dart';

class BottonNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarDemoState();
  }
}

class _BottomNavigationBarDemoState extends State<BottonNavigationBarDemo> {
  int _currentIndex = 0;
  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
        //设置目前选择哪一个index
        currentIndex: _currentIndex,
        //设置点击事件 回调
        onTap: _onTapHandler,
        //设置导航栏的类型
        type: BottomNavigationBarType.fixed,
        //选中为蓝色
        fixedColor: Colors.blue,
        //设置具体的Item
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('History'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('List'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('My'),
          ),
        ]);
  }
}
