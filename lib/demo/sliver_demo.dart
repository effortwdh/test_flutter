import 'package:flutter/material.dart';
import 'package:ninghao_flutter/model/post.dart';
import '../model/post.dart';

//也是网格视图， 跟之前的ViewDemo类似
class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        //这个app栏 会随着 页面的移动 变化
        SliverAppBar(
          //title: Text('ceshi'),
          //可以固定app栏 默认false
          //pinned: true,
          //只要向上就显示出了来，不要移动到顶部才出来
          floating: true,
          expandedHeight: 178.0,
          //设置标签栏的样式
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              'Https://resources.ninghao.net/images/overkill.png',
              fit: BoxFit.cover,
            ),
            title: Text(
              'ceshi'.toUpperCase(),
              style: TextStyle(
                fontSize: 15.0,
                letterSpacing: 3.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        //设置安全区域
        SliverSafeArea(
            sliver: //添加内边距
                SliverPadding(
          padding: EdgeInsets.all(8.0),
          sliver: SliverGridDemo(),
        ))
      ],
    ));
  }
}

//列表视图
class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          //添加边距
          return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            //添加效果
            child: Material(
                borderRadius: BorderRadius.circular(9.0),
                elevation: 14.0,
                shadowColor: Colors.grey.withOpacity(0.5),
                //添加内容
                child: Stack(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        posts[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 32.0,
                      left: 32.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            posts[index].title,
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Text(
                            posts[index].author,
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}

//网格视图
class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        //长宽比
        childAspectRatio: 0.8,
      ),
    );
  }
}
