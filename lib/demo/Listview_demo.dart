import 'package:flutter/material.dart';
import 'package:ninghao_flutter/demo/Post_show.dart';
import 'Post_show.dart';
import '../model/post.dart';

class ListViewDemo extends StatelessWidget {
  Widget _listItemBulider(BuildContext context, int index) {
    return Container(
        //常见画图
        color: Colors.white, //背景色
        margin: EdgeInsets.all(8.0), //边缘宽度
        child: Stack(
          children: <Widget>[
            Column(
              //列排序
              children: <Widget>[
                //一个widget数组
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(posts[index].imageUrl),
                ),
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
            //添加 点击按钮
            Positioned.fill(
                child: Material(
              color: Colors.transparent,
              //带溅墨效果的区域
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.white.withOpacity(0.1),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PostShow(post: posts[index])));
                },
              ),
            ))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBulider,
    );
  }
}
