import 'package:flutter/material.dart';
import 'package:ninghao_flutter/demo/from_demo.dart';
//列表demo
import 'demo/Listview_demo.dart';
import 'demo/Drawer_Demo.dart';
import 'demo/Botton_navigation_bar_demo.dart';
import 'demo/Basic_Demo.dart';
import 'demo/layout_demo.dart';
import 'demo/View_Demo.dart';
import 'demo/sliver_demo.dart';
import 'demo/NavigatorDame.dart';
import 'demo/from_demo.dart';
import 'demo/material_components.dart';
import 'demo/state/state_management.dart';
import 'demo/stream/stream_demo.dart';
import 'demo/http/http_demo.dart';
import 'demo/rxdart/rxdart_demol.dart';
import 'demo/bloc/bloc_demo.dart';
import 'demo/container_demo.dart';
import 'demo/certification_information.dart';
import 'demo/mine_news.dart';
void main() => runApp(App()); //根据app类初始化返回的widget来绘制页面

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //类似于初始化函数 有一个widget返回 可以给其他调用函数使用
    return MaterialApp(
        debugShowCheckedModeBanner: false, //不展示debug条幅
        //home: Home(),
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
        home: CertificationInformation(),
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
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}
class HomeState extends State<StatefulWidget> {
  int _currentIndex = 0;
  Widget _currBody = TabBarView(
    children: <Widget>[
      //第一个页的第一个视图
      ListViewDemo(),
      //第一个页的第二个视图
      BasicDemo(),
      //第一个页的第三个视图
      LayoutDemo(),
      //第一个页的第四个视图
      ViewDemo(),
      //第一个页的第五个视图
      SliverDemo(),
    ],
  );
  _onTap(int index) {
    switch (index) {
      //第二个页面
      case 1:
        _currBody = TabBarView(
          children: <Widget>[
            //第二个页的第一个视图
            ContainerDemo(),
            //第一个页的第二个视图
            BasicDemo(),
            //第一个页的第三个视图
            LayoutDemo(),
            //第一个页的第四个视图
            ViewDemo(),
            //第一个页的第五个视图
            SliverDemo(),
          ],
        );
        break;
      case 2:
        _currBody = FromDemo();
        break;
      case 3:
        _currBody = MaterialComponents();
        break;
      case 0:
        _currBody = TabBarView(
          children: <Widget>[
            //第一个页的第一个视图
            ListViewDemo(),
            //第一个页的第二个视图
            BasicDemo(),
            //第一个页的第三个视图
            LayoutDemo(),
            //第一个页的第四个视图
            ViewDemo(),
            //第一个页的第五个视图
            SliverDemo(),
          ],
        );
        break;
    }
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //控制tabbar和tabbarView的连接
      length: 5,
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
              Tab(icon: Icon(Icons.airport_shuttle)),
            ],
          ),
        ),
        //tabbar具体内容
        body: _currBody,
        //左边使用扫动来打开抽屉
        drawer: DrawerDemo(),
        //右边使用扫动来打开抽屉
        //endDrawer: Text('This is right drawer'),
        bottomNavigationBar: BottomNavigationBar(
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
            ]),
      ),
    );
  }
}
