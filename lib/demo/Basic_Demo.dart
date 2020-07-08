import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey[100],
      //添加背景图片
      decoration: BoxDecoration(
        //和color属性冲突
        image: DecorationImage(
          image: NetworkImage(
              'https://resources.ninghao.org/images/say-hello-to-barry.jpg'),
          alignment: Alignment.topCenter,
          //图片不够大按y轴 复制填充
          //repeat: ImageRepeat.repeatY,
          //按照比例适配图片
          fit: BoxFit.cover,
          //添加滤镜
          colorFilter: ColorFilter.mode(
              Colors.indigoAccent[400].withOpacity(0.5), BlendMode.hardLight),
        ),
      ),
      child: Row(
        //设置位于主窗口居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(
              Icons.pool,
              size: 32.0,
              color: Colors.white,
            ),
            //color: Color.fromRGBO(3, 54, 255, 1.0),
            //设置内边距
            padding: EdgeInsets.all(16),
            //设置外边距
            margin: EdgeInsets.all(8.0),
            //设置宽度 高度
            width: 90,
            height: 90,
            //设置装饰
            decoration: BoxDecoration(
              //会和上面的color冲突
              color: Color.fromRGBO(3, 54, 255, 1.0),
              //添加边框
              border: Border.all(
                color: Colors.indigoAccent[100],
                width: 3.0,
                style: BorderStyle.solid,
              ),
              //设置圆角的大小 90度就是圆 可以使用only添加不同圆角
              borderRadius: BorderRadius.circular(16.0),
              //添加阴影
              boxShadow: [
                BoxShadow(
                  //阴影偏移
                  offset: Offset(6.0, 7.0),
                  color: Color.fromRGBO(16, 20, 188, 1.0),
                  //模糊程度 越大程度越深
                  blurRadius: 5.0,
                  //控制阴影面积
                  spreadRadius: 3.0,
                )
              ],
              //box形状 现在是矩形 可以使用circle
              shape: BoxShape.rectangle,
              //设置渐变 径向渐变
              // gradient: RadialGradient(
              //   colors: [
              //     Color.fromRGBO(7, 102, 255, 1.0),
              //     Color.fromRGBO(3, 28, 128, 1.0),
              //   ],
              // ),
              //设置渐变 线向渐变
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 28, 128, 1.0),
                ],
                //调整开始结束的 位置 由从左到右变为从上到下
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'test',
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 34,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w100,
          ),
          //孩子样式 继承以上样式，可以根据孩子特别修改
          children: [
            TextSpan(
                text: '.net',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w300,
                ))
          ]),
    );
  }
}

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //不可修改的样式
    final _textStyle = TextStyle(
      fontSize: 16.0,
    );

    final String _author = '李白';
    final String _titler = '将进酒';

    return Text(
      '《$_titler》--$_author\n君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。岑夫子，丹丘生，将进酒，杯莫停。',
      //设置对其方式
      textAlign: TextAlign.center,
      //设置样式
      style: _textStyle,
      //最大行
      maxLines: 4,
      //溢出行操作
      overflow: TextOverflow.ellipsis,
    );
  }
}
