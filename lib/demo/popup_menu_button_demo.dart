import 'package:flutter/material.dart';

class PopupMenuButtonDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _PopupMenuButtonDemoState();
  }
}
class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo>{
  String _outText = 'Text';
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('popupMenuDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(_outText),
                  PopupMenuButton(
                    onSelected: (value){
                      setState(() {
                        _outText = value;
                      });
                      print(value);
                    },
                    itemBuilder: (BuildContext context) =>[

                      PopupMenuItem(
                          value: 'Home',
                          child: Text('Hone')),
                      PopupMenuItem(
                          value: 'Home1',
                          child: Text('Hone')),
                      PopupMenuItem(
                          value: 'Home2',
                          child: Text('Hone')),
                      PopupMenuItem(
                          value: 'Home3',
                          child: Text('Hone')),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
  }
}