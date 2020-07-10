import 'package:flutter/material.dart';
import 'dart:async';
//为了选项操作做准备
enum Option{
  A,B,C
}
//新建对话框
//显示对话框
class SimpleDialogDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SimpleDialogDemoState();
  }
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo>{
  String _choice = 'Nothing';
  //使用async方法
  Future _openSimpleDialog() async {
    //返回option的值
    final option = await showDialog(
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            title: Text('Simpledialog'),
            children: <Widget>[
              //添加对话框选项
              SimpleDialogOption(
                child: Text('Op 1'),
                onPressed: (){
                  Navigator.pop(context,Option.A);
                },
              ),
              SimpleDialogOption(
                child: Text('Op 2'),
                onPressed: (){
                  Navigator.pop(context,Option.B);
                },
              ),
              SimpleDialogOption(
                child: Text('Op 3'),
                onPressed: (){
                  Navigator.pop(context,Option.C);
                },
              ),
            ],
          );
        });
    switch(option){
      case Option.A:
        setState(() {
          _choice = 'A';
        });
        break;
      case Option.B:
        setState(() {
          _choice = 'B';
        });
        break;
      case Option.C:
        setState(() {
          _choice = 'C';
        });
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleDialogDemo'),

      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
            children: <Widget>[
              Text(_choice),
            ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_align_center),
        onPressed: _openSimpleDialog,
      ),
    );
  }
}