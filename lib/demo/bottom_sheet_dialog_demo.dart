import 'package:flutter/material.dart';
import 'dart:async';
//为了选项操作做准备
enum Action{
  OK,Cancel
}
//显示对话框
class BottomSheetDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _BottomSheetDemoState();
  }
}
//展示方案二
class _BottomSheetDemoState extends State<BottomSheetDemo>{
  String outText = 'Nothing';
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();
  Future _openModalBottonSheet() async{
    final test = await showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(height: 200,
      child: Column(
        children: <Widget>[
          ListTile(title: Text('first'),onTap: (){
            Navigator.pop(context,'A');
          },),
          ListTile(title: Text('second'),onTap: (){
            Navigator.pop(context,'B');
          },),
          ListTile(title: Text('third'),onTap: (){
            Navigator.pop(context,'C');
          },),
        ],
      ),);
    });
    setState(() {
      outText = test;
    });
    print(outText);
  }

  //展示方案一
  _openBottonSheet(){
    _bottomSheetScaffoldKey.currentState.showBottomSheet(
        (BuildContext context){
          return BottomAppBar(
            child: Container(
              child: Row(
                children: <Widget>[
                  Icon(Icons.accessibility),
                  Text('Text'),
                ],
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text('BottomSheetDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
            children: <Widget>[
              FlatButton(
                child: Text('OpenBottonSheet'),
                onPressed: _openBottonSheet,
              ),
              FlatButton(
                child: Text('OpenModalBottonSheet'),
                onPressed: _openModalBottonSheet,
              )
            ],
        ),

      ),
    );
  }
}