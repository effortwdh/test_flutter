import 'package:flutter/material.dart';
import '../model/post.dart';

class ListViewDemo extends StatelessWidget {
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
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBulider,
    );
  }
}
