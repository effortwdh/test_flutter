import 'package:flutter/material.dart';
import 'dart:async';
//为了选项操作做准备
enum Action{
  OK,Cancel
}
//显示对话框
class AlertDialogDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AlertDialogDemoState();
  }
}

class _AlertDialogDemoState extends State<AlertDialogDemo>{
  String _action = 'Nothing';
  //调用提示对话框
  Future _onpenAlertDialog() async {
    final action = await showDialog(
      context: context,
      //点旁边不能退出
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(
            'AlertDialog'
          ),
          content: Text('Are show sure about?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel') ,
              onPressed: (){
                Navigator.pop(context,Action.Cancel);
              },
            ),
            FlatButton(
              child: Text('OK') ,
              onPressed: (){
                Navigator.pop(context,Action.OK);
              },
            ),
          ],
        );
      }
    );
    switch (action){
      case Action.OK:
        setState(() {
          _action = 'OK';
        });
        break;
      case Action.Cancel:
        setState(() {
          _action = 'Cancel';
        });
        break;

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogDemo'),

      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
            children: <Widget>[
              Text('try:$_action'),
              RaisedButton(
                child: Text('Open AlertDialog'),
                onPressed: _onpenAlertDialog,
              )
            ],
        ),

      ),
    );
  }
}