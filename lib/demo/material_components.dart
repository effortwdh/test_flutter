import 'package:flutter/material.dart';
import 'popup_menu_button_demo.dart';
import 'simple_dialog_demo.dart';
import 'alert_dialog_demo.dart';
import 'bottom_sheet_dialog_demo.dart';
import 'SnackBar_dialog_demo.dart';
import 'from_demo.dart';
import 'checkbox_demo.dart';
import 'date_time_demo.dart';
class MaterialComponents extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(title: 'FloactionButton',pageWidget: FloatingActionButtonDemo(),),
          ListItem(title: 'ButtonDemo',pageWidget: ButtonDemo(),),
          ListItem(title: 'popupMenuButton',pageWidget: PopupMenuButtonDemo(),),
          ListItem(title: 'simpleDialogDemo',pageWidget: SimpleDialogDemo(),),
          ListItem(title: 'AlertDialogDemo',pageWidget: AlertDialogDemo(),),
          ListItem(title: 'BottomSheetDemo',pageWidget: BottomSheetDemo(),),
          ListItem(title: 'SnackBarDemo',pageWidget: SnackBarDemo(),),
          ListItem(title: 'From',pageWidget: FromDemo(),),
          ListItem(title: 'CheckBoxDemo',pageWidget: CheckBoxDemo(),),
          ListItem(title: 'DataTimeDemo',pageWidget: DataTimeDemo(),),
        ],
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //占满屏幕
        Expanded(
          child: //文字按钮
          FlatButton(
            child: Text('Button'),
            onPressed: (){},
            splashColor: Colors.grey,
            textColor: Theme.of(context).accentColor,
            highlightColor: Colors.deepOrangeAccent,
          ),
        ),
        SizedBox(
          width: 30,
        ),
        //图片加文字按钮
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('Add'),
          onPressed: (){},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    //有背景色button
    final Widget RaisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //添加主题
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
//              shape: BeveledRectangleBorder(
//                borderRadius: BorderRadius.circular(5.0),
//              ),
            shape: StadiumBorder(),
            ),
          ),
          child: RaisedButton(
            child: Text('Button1'),
            onPressed: (){},
            splashColor: Colors.grey,
            textColor: Colors.amberAccent,
          ),
        ),

        //文字按钮
        RaisedButton(
          child: Text('Button'),
          onPressed: (){},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        //图片加文字按钮
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('Add'),
          onPressed: (){},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    //大纲按钮
    final Widget OutLineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //添加主题
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
//              shape: BeveledRectangleBorder(
//                borderRadius: BorderRadius.circular(5.0),
//              ),
              shape: StadiumBorder(),
            ),
          ),
          child: OutlineButton(
            child: Text('Button1'),
            onPressed: (){},
            //按钮点击溅射颜色
            splashColor: Colors.grey,
            textColor: Colors.amberAccent,
          ),
        ),

        //文字按钮
        OutlineButton(
          child: Text('Button'),
          onPressed: (){},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,

          borderSide: BorderSide(
            color: Colors.indigoAccent,
          ),

        ),
        //图片加文字按钮 添加宽度高度
        Container(
          height: 40,
          width:  130,
          child: OutlineButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add'),
            onPressed: (){},
            splashColor: Colors.grey,
            textColor: Theme.of(context).accentColor,
          ),
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //无背景色
            flatButtonDemo,
            RaisedButtonDemo,
            OutLineButtonDemo
          ],
        ),
      ),
    );
  }
}


//浮动按钮 飘浮在页面上面
class FloatingActionButtonDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: (){},
      child: Icon(Icons.add),
      elevation: 0.0,
      backgroundColor: Colors.black87,
//      shape: BeveledRectangleBorder(
//        borderRadius: BorderRadius.circular(30),
//      ),
    );
    final Widget _floatingActionButtonExtends = FloatingActionButton.extended(
      onPressed: (){},
      label: Text('Add'),
      icon: Icon(Icons.add),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
        elevation: 0.0,
      ),
      //添加浮动小图标
      floatingActionButton: _floatingActionButton,
      //floatingActionButton: _floatingActionButtonExtends,
      //设置浮动按钮为 中间对接
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //设置底部工具栏
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
        ),
        //切出一个圆形接口
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class ListItem extends StatelessWidget{
  final String title;
  final Widget pageWidget;
  //初始化属性
  ListItem({
    this.pageWidget,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: (){
        Navigator.of(context).push(
          //创建 一个页面 把页面压到navigator的stack中
          MaterialPageRoute(builder: (context) => pageWidget),
        );
      },
    );
  }
}