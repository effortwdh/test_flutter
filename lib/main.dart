import 'package:flutter/material.dart';
import 'package:ninghao_flutter/demo/NavigatorDame.dart';
import 'package:ninghao_flutter/demo/from_demo.dart';

import 'demo/Drawer_Demo.dart';
import 'demo/explore_demo.dart';
import 'demo/from_demo.dart';
import 'demo/material_components.dart';
import 'demo/mine_news.dart';
import 'demo/test_list_demo.dart';
void main() => runApp(App()); //根据app类初始化返回的widget来绘制页面

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //类似于初始化函数 有一个widget返回 可以给其他调用函数使用
    return MaterialApp(
        debugShowCheckedModeBanner: false, //不展示debug条幅
        routes: {
          '/about': (context) => FromDemo(),
        },
        initialRoute: '/',
        onGenerateRoute: (RouteSettings routeSettings) {
          print('onGenerateRoute:$routeSettings');
          if (routeSettings.name == 'container') {
            return MaterialPageRoute(builder: (context) {
              return NavagatorDamo();
            });
          }
        },
        home: Home(),
        //home默认是根
        //home: NavagatorDamo(),
        //注册页面
        //home: FromDemo(),
        //按钮页面
        //home: MaterialComponents(),
        //状态管理页面
        //home: StateManagementDemo2(),
        //Stream
        //home: StreamDemo(),
        //http
        //home:HttpDemo(),
        //Rxdart
        //home: RxdartDemo(),
        //Bloc框架
        //home: BlocDemo(),
        //initialRoute: '/about',
        //initialRoute: '/',
//        routes: {
//          '/':(context) => Home(),
//          '/about': (context) => Page(
//                title: 'About',
//              ),
//          '/form': (context) => FromDemo(),
//        },
        //模仿认证信息页面
        //home: CertificationInformation(),
        //模仿我的消息页面
        //home: MineNews(),
        theme: ThemeData(
          primarySwatch: Colors.green,
          //设置点击时候的水波纹样式
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70,
        ));
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<StatefulWidget> {
  int _currentIndex = 0;

  var pageList;
  @override
  void initState() {
    pageList = [
      ExploreDemo(),
      MaterialComponents(),
      TestListDemo(),
      MineNews(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      //body: pageList,
      body: IndexedStack(
        index: _currentIndex,
        children: pageList,
      ),
      //左边使用扫动来打开抽屉
      drawer: DrawerDemo(),
      //右边使用扫动来打开抽屉
      //endDrawer: Text('This is right drawer'),
      bottomNavigationBar: BottomNavigationBar(
          //设置目前选择哪一个index
          currentIndex: _currentIndex,
          //设置点击事件 回调
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
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
          ]),
    );
  }
}
