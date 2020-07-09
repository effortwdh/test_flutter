import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewBuliderDemo();
  }
}

//网格 使用bulider方法创建
class GridViewBuliderDemo extends StatelessWidget {
  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
      //可以设置数目 也可以设置大小
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 3,
      //   crossAxisSpacing: 8.0,
      //   mainAxisSpacing: 8.0,
      // ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
    );
  }
}

//使用extent网格方法 就是定义每行几个的方式不同
class GridViewExtentDemo extends StatelessWidget {
  //返回一个list<Widget>数组
  List<Widget> _bulidTiles(int length) {
    //使用generate 构造 index 是一个回调函数
    return List.generate(length, (int index) {
      return Container(
        alignment: Alignment(0.0, 0.0),
        color: Colors.grey[300],
        child: Text(
          'Item$index',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //网格视图
    return GridView.extent(
      //横轴最大范围
      maxCrossAxisExtent: 200.0,
      //边距
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      //变成水平滚动
      //scrollDirection: Axis.horizontal,
      children: _bulidTiles(100),
    );
  }
}

//使用网格视图
class GridViewCount extends StatelessWidget {
  //返回一个list<Widget>数组
  List<Widget> _bulidTiles(int length) {
    //使用generate 构造 index 是一个回调函数
    return List.generate(length, (int index) {
      return Container(
        alignment: Alignment(0.0, 0.0),
        color: Colors.grey[300],
        child: Text(
          'Item$index',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //网格视图
    return GridView.count(
      //一行多少个
      crossAxisCount: 3,
      //边距
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      //变成水平滚动
      scrollDirection: Axis.horizontal,
      children: _bulidTiles(100),
    );
  }
}

//使用PageViewBulider方法
class PageViewBuliderDemo extends StatelessWidget {
  //固定格式，返回值和传入值固定
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        //添加box.expand 是为了可以把图拉大
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        //添加定位
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                posts[index].author,
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      //每一页使用的widget
      itemBuilder: _pageItemBuilder,
    );
  }
}

//使用的pageView的组件
class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      //页面捕捉
      //pageSnapping: false,
      //页面顺序相反
      //reverse: true,
      //页面由水平改垂直
      //scrollDirection: Axis.vertical,
      //切换页面触发事件
      onPageChanged: (currentPage) => debugPrint('page:$currentPage'),
      //设置初始打开页面
      controller: PageController(
        initialPage: 1,
        //记录目前所在页面 默认为true
        keepPage: false,
        //占用页面的比例 默认为1.0
        viewportFraction: 0.85,
      ),
      children: <Widget>[
        //设置每一个页的内容
        Container(
          color: Colors.brown[100],
          alignment: Alignment(0, 0),
          child: Text(
            'one',
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          color: Colors.black87,
          alignment: Alignment(0, 0),
          child: Text(
            'two',
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          color: Colors.green[100],
          alignment: Alignment(0, 0),
          child: Text(
            'Three',
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
