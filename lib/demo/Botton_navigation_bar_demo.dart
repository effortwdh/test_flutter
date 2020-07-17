import 'package:flutter/material.dart';
import 'NavigatorDame.dart';
import 'from_demo.dart';
import 'material_components.dart';
import '../main.dart';
class BottonNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarDemoState();
  }
}

class _BottomNavigationBarDemoState extends State<BottonNavigationBarDemo> {
  int _currentIndex = 0;
  Widget _currBody = App();
  _onTap(int index) {
    switch (index) {
      case 3:
        _currBody = NavagatorDamo();;
        break;
      case 1:
        _currBody = FromDemo();
        break;
      case 2:
        _currBody = MaterialComponents();
        break;
      case 0:
        _currBody = App();
        break;
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        //设置目前选择哪一个index
        currentIndex: _currentIndex,
        //设置点击事件 回调
        onTap: _onTap,
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
