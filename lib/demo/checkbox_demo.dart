import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
class CheckBoxDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CheckBoxDemoState();
  }
}

class _CheckBoxDemoState extends State<CheckBoxDemo>{
  //判断是否点击
  bool _checkBoxItemA =false;
  int _radioGrouA = 0;
  bool _switchA = false;
  void _handleRadioValueChanged(int value){
    setState(() {
      _radioGrouA = value;
    });
  }
  void _onchange(bool value){
    setState(() {
      _switchA = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBarDemo'),

      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.indigoAccent,
              height: 80,
              child://复选框
              CheckboxListTile(
                value: _checkBoxItemA,
                onChanged: (value){
                  setState(() {
                    _checkBoxItemA = value;
                  });
                },
                title: Text('title'),
                subtitle: Text('subtitle'),
                secondary: Icon(Icons.accessibility),
                selected: _checkBoxItemA,
              ),

            ),
            Container(
              color: Colors.deepOrangeAccent,
              height: 80,
              child: //多选框
              Checkbox(
                value: _checkBoxItemA,
                onChanged: (value){
                  setState(() {
                    _checkBoxItemA = value;
                  });
                },
                activeColor: Colors.black87,
              ),
            ),
            //单选按钮
            Container(
              color: Colors.amber,
              child:
              Radio(
                value: 0,
                groupValue: _radioGrouA,
                onChanged: _handleRadioValueChanged,
              ),
            ),
            Container(
              color: Colors.amber,
              child:
              Radio(
                value: 1,
                groupValue: _radioGrouA,
                onChanged: _handleRadioValueChanged,
              ),
            ),
            Container(
              color: Colors.amber,
              child:
                  Column(
                    children: <Widget>[
                      RadioListTile(
                        value: 0,
                        groupValue: _radioGrouA,
                        onChanged: _handleRadioValueChanged,
                        title: Text('test'),
                        subtitle: Text('subtitle'),
                        selected: _radioGrouA == 0,
                        secondary: Icon(Icons.add_alert),
                      ),
                      RadioListTile(
                        value: 1,
                        groupValue: _radioGrouA,
                        onChanged: _handleRadioValueChanged,
                        title: Text('test'),
                        subtitle: Text('subtitle'),
                        selected: _radioGrouA == 0,
                        secondary: Icon(Icons.add_alert),
                      )
                    ],
                  )
            ),
            Container(
              color: Colors.tealAccent,
              child:
              Switch(
                value: _switchA,
                onChanged: _onchange,
              )
            ),
            Container(
                color: Colors.tealAccent,
                child:
                SwitchListTile(
                  title: Text("开关"),
                  value: _switchA,
                  onChanged: _onchange,
                )
            ),
          ],
        ),

      ),
    );
  }
}