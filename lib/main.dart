import 'package:flutter/material.dart';
import 'model/post.dart';

void main() => runApp(App()); //根据app类初始化返回的widget来绘制页面

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //类似于初始化函数 有一个widget返回 可以给其他调用函数使用
    return MaterialApp(
        home: Home(), theme: ThemeData(primarySwatch: Colors.green));
  }
}

class Home extends StatelessWidget {
  Widget _listItemBulider(BuildContext context, int index) {
    return Container(
      //常见画图
      color: Colors.white, //背景色
      margin: EdgeInsets.all(8.0), //边缘宽度
      child: Column(
        //列排序
        children: <Widget>[
          //一个widget数组
          Image.network(posts[index].imageUrl),
          SizedBox(height: 16.0), //设置间距
          Text(
            posts[index].title,
            style: Theme.of(context).textTheme.title, //title风格
          ),
          Text(
            posts[index].author,
            style: Theme.of(context).textTheme.subhead,
          ),
          SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('test1'),
        //设置阴影
        elevation: 30,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: _listItemBulider,
      ),
    );
  }
}

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('hello world',
          textDirection: TextDirection.ltr,
          style: TextStyle(
              //设置大小
              fontSize: 40.0,
              //设置样式宽度
              fontWeight: FontWeight.bold,
              //设置颜色
              color: Colors.yellow)),
    );
  }
}
