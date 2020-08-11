import 'package:flutter/material.dart';
import 'dart:async';
class ExpansionPannelItem{
  final String headerText;
  final Widget body;
  bool isExpanded;
  ExpansionPannelItem({
    this.headerText,
    this.body,
    this.isExpanded,
});

}
//展开菜单
class SnackBarDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SnackBarDemoState();
  }
}

class _SnackBarDemoState extends State<SnackBarDemo>{
  bool _expand = false;
  List<ExpansionPannelItem> _expansionPannelItems;
  @override
  void initState() {
    super.initState();
    _expansionPannelItems = <ExpansionPannelItem>[
      ExpansionPannelItem(
        headerText: 'Title A',
        isExpanded:  false,
        body: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Text('test1 A'),
        ),
      ),ExpansionPannelItem(
        headerText: 'Title B',
        isExpanded:  false,
        body: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Text('test1 B'),
        ),
      ),ExpansionPannelItem(
        headerText: 'Title C',
        isExpanded:  false,
        body: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Text('test1 C'),
        ),
      )
    ];
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
              //SnakeBarButton(),
              ExpansionPanelList(
                //设置回调 执行打开列表收缩列表
                expansionCallback: (int index,bool isExpanded){
                  setState(() {
                    _expansionPannelItems[index].isExpanded = !_expansionPannelItems[index].isExpanded;
                  });
                },
                children: _expansionPannelItems.map(
                    (ExpansionPannelItem item){
                      return ExpansionPanel(
                        isExpanded: item.isExpanded,
                        body: item.body,
                        headerBuilder: (BuildContext context,bool isExpanded){
                          return Container(
                            padding: EdgeInsets.all(16),
                            child: Text(item.headerText),);
                        }
                      );
                    }
                ).toList(),

                )

            ],
        ),

      ),
    );
  }
}
class SnakeBarButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Button'),
      onPressed: (){
        Scaffold.of(context).showSnackBar(
            SnackBar(
              content:Text('Processing'),
              action: SnackBarAction(
                label: 'OK',
                onPressed: (){},
              ),
            ));
      },
    );
  }
}
