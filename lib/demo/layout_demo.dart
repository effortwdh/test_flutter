import 'package:flutter/material.dart';

//根据主轴交叉轴调整位置
// class LayoutDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //可以选择横排(Row)or竖排Column
//       child: Column(
//         //根据主轴 调整位置 跟主轴垂直的轴就是交叉轴
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         //根据交叉轴调整位置
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           IconBadge(Icons.pool),
//           IconBadge(
//             Icons.beach_access,
//             size: 64,
//           ),
//           IconBadge(Icons.tab),
//         ],
//       ),
//     );
//   }
// }
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // AspectRatio(
          //   //设置宽高比 3/2
          //   aspectRatio: 3.0 / 2.0,
          //   child: Container(
          //     color: Color.fromRGBO(3, 54, 255, 1.0),
          //   ),
          // )
          //带限制的容器 设置最大最小宽高
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 200.0),
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0),
            ),
          )
        ],
      ),
    );
  }
}

//使用stack 来存储sizedbox
class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //可以选择横排(Row)or竖排Column
      child: Column(
        //根据主轴 调整位置 跟主轴垂直的轴就是交叉轴
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //一箩筐小构件, 由大的sizebox来当底板
          Stack(
            alignment: Alignment(1.0, 1.0),
            children: <Widget>[
              //设置box大小
              SizedBox(
                width: 200.0,
                height: 300.0,
                child: Container(
                  //调整里面 Icon 的位置
                  alignment: Alignment(0.0, -0.8),
                  //设置样式
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(3, 54, 255, 1.0),
                    //圆角
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(
                    Icons.ac_unit,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(3, 54, 255, 1.0),
                      //borderRadius: BorderRadius.circular(8.0),
                      shape: BoxShape.circle,
                      //添加渐变
                      gradient: RadialGradient(colors: [
                        Color.fromRGBO(7, 102, 255, 1.0),
                        Color.fromRGBO(3, 54, 255, 1.0),
                      ])),
                  child: Icon(
                    Icons.access_alarm,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
              //使用Positioned来设置位置
              Positioned(
                left: 20.0,
                top: 20.0,
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                  size: 32,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

//自己定义的小图片
class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  IconBadge(this.icon, {this.size = 32.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
