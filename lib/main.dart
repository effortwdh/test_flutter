import 'package:flutter/material.dart';
//列表demo
import 'demo/Listview_demo.dart';
import 'demo/Drawer_Demo.dart';
import 'demo/Botton_navigation_bar_demo.dart';
import 'demo/Basic_Demo.dart';
import 'demo/layout_demo.dart';
import 'demo/View_Demo.dart';

void main() => runApp(App()); //根据app类初始化返回的widget来绘制页面

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //类似于初始化函数 有一个widget返回 可以给其他调用函数使用
    return MaterialApp(
        debugShowCheckedModeBanner: false, //不展示debug条幅
        home: Home(),
        theme: ThemeData(
          primarySwatch: Colors.green,
          //设置点击时候的水波纹样式
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70,
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //控制tabbar和tabbarView的连接
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          //设置左边的图标按钮 下面设置好 就会自动添加
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigration',
          //   onPressed: () => debugPrint("leading check!"),
          // ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Navigration',
              onPressed: () => debugPrint("action check!"),
            )
          ],
          title: Text('test1'),
          //设置阴影
          elevation: 30,
          //AppBar 下面添加一个tabbar 里面添加 三个小图标
          bottom: TabBar(
            //设置未被选中的label颜色
            unselectedLabelColor: Colors.black38,
            //设置选中的下面的横线的属性
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.view_quilt)),
            ],
          ),
        ),
        //tabbar具体内容
        body: TabBarView(
          children: <Widget>[
            //第一个页的第一个视图
            ListViewDemo(),
            //第一个页的第二个视图
            BasicDemo(),
            //第一个页的第三个视图
            LayoutDemo(),
            //第一个页的第四个视图
            ViewDemo(),
          ],
        ),
        //左边使用扫动来打开抽屉
        drawer: DrawerDemo(),
        //右边使用扫动来打开抽屉
        //endDrawer: Text('This is right drawer'),
        bottomNavigationBar: BottonNavigationBarDemo(),
      ),
    );
  }
}
