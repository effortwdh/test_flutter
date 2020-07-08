import 'package:flutter/material.dart';

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
