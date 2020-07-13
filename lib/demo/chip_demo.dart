import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
class ChipDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ChipDemoState();
  }
}

class _ChipDemoState extends State<ChipDemo>{
  List<String>_tags = [
    'A',
    'B',
    'C',
  ];
  String _outText ='Nothing';
  List<String> _selected = [];
  String _choice = 'C';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_to_photos),
        onPressed: (){
          setState(() {
            _tags=[
              'A',
              'B',
              'C',
            ];

            _selected = [];
          });

        },
      ),
      body:
      Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.indigoAccent,
              child:
                  //为了防止超出 改为Wrap 可以自动换行
                  Wrap(
                    spacing: 5.0,
                    children: <Widget>[
                      Chip(
                        label: Text('test'),
                      ),
                      //带删除的Chip
                      Chip(
                        label: Text('Delete'),
                        deleteIcon: Icon(Icons.delete),
                        //长按提示信息
                        deleteButtonTooltipMessage: 'tag 删除',
                        onDeleted: (){

                        },
                      ),
                      //分隔符
                      Divider(
                        color: Colors.grey,
                        height: 32,
                        indent: 20,
                      ),
                      Chip(
                        label: Text('test'),
                        backgroundColor: Colors.orange,
                      ),
                      Chip(
                        label: Text('test'),
                        backgroundColor: Colors.orange,
                        //前方
                        avatar: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Text('魏'),
                        )
                      ),
                      Chip(
                          label: Text('test'),
                          backgroundColor: Colors.orange,
                          //前方
                          avatar: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Text('魏'),
                          )
                      ),
                      Chip(
                          label: Text('test'),
                          backgroundColor: Colors.orange,
                          //前方
                          avatar: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Text('魏'),
                          )
                      ),
                      Chip(
                          label: Text('test'),
                          backgroundColor: Colors.orange,
                          //前方
                          avatar: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Text('魏'),
                          )
                      ),
                      Wrap(
                        spacing: 8.0,
                        children:_tags.map((tag){
                            return Chip(
                              label: Text(tag),
                              onDeleted:(){
                                setState(() {
                                  _tags.remove(tag);
                                });
                              },
                            );
                          }).toList(),

                      ),
                      //ActionChip
                      Divider(
                        color: Colors.grey,
                        height: 32,
                        indent: 20,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text('ActionChip可以点击：'+_outText),
                      ),
                      Wrap(
                        spacing: 8.0,
                        children:_tags.map((tag){
                          return ActionChip(
                            label: Text(tag),
                            onPressed: (){
                              setState(() {
                                _outText = tag;
                              });
                            },
                          );
                        }).toList(),

                      ),
                      //FilterChip 可以
                      Divider(
                        color: Colors.grey,
                        height: 32,
                        indent: 20,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text('FilterChip'+_selected.toString()),
                      ),
                      Wrap(
                        spacing: 8.0,
                        children:_tags.map((tag){
                          return FilterChip(
                            label: Text(tag),
                            selected: _selected.contains(tag),
                            onSelected: (value){
                              setState(() {
                                if(_selected.contains(tag))
                                  _selected.remove(tag);
                                else
                                  _selected.add(tag);
                              });

                            },
                          );
                        }).toList(),

                      ),
                      //ChoiceChip 可以
                      Divider(
                        color: Colors.grey,
                        height: 32,
                        indent: 20,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text('ChoiceChip'+_choice),
                      ),
                      Wrap(
                        spacing: 8.0,
                        children:_tags.map((tag){
                          return ChoiceChip(
                            label: Text(tag),
                            selected: _choice == tag,
                            onSelected: (value){
                              setState(() {
                                _choice = tag;
                              });

                            },
                          );
                        }).toList(),

                      ),
                    ],
                  )

            ),

          ],
        ),

      ),
    );
  }
}