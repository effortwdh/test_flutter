import 'package:flutter/material.dart';
import 'package:ninghao_flutter/demo/simple_dialog_demo.dart';
//登录界面
class FromDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //基本的页面结构
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
        body: Theme(
      //重新定义应用的主题
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //添加文本框
            //TextFieldDemo(),
            //添加注册页面
            ReginsterForm(),

          ],
        ),
      ),
    ));
  }
}

class ReginsterForm extends StatefulWidget {
  ReginsterFormState createState() => ReginsterFormState();
}

class ReginsterFormState extends State<ReginsterForm> {
  final reginsterFormKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;
  //点击提交按钮触发事件
  void submitRegisterForm() {
    //执行验证方法
    if (reginsterFormKey.currentState.validate()) {
      //保存reginsterForm表单保存内容
      reginsterFormKey.currentState.save();

      debugPrint('username$username');
      debugPrint('password$password');
      //屏幕底部显示登入中
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Registering...'),
      ));
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  //验证表单数据方法
  String validateUsername(value) {
    if (value.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      //key保存
      key: reginsterFormKey,
      child: Column(
        children: <Widget>[
          //账号
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
            ),
            //执行保存
            onSaved: (value) {
              username = value;
            },
            //添加验证函数
            validator: validateUsername,
            //自动验证
            autovalidate: autovalidate,
          ),
          //密码
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'password',
            ),
            onSaved: (value) {
              password = value;
            },
            validator: validatePassword,
            autovalidate: autovalidate,
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0.0,
              onPressed: submitRegisterForm,
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  TextFieldDemoState createState() => TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemo> {
  //添加控制器
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    //消除控制器
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //设置初始的值
    //textEditingController.text = 'hi';
    //设置监听器
    textEditingController.addListener(() {
      debugPrint("input:${textEditingController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    //返回文本框
    return TextField(
      //绑定控制器
      controller: textEditingController,
      //文本框内容改变时候触发
      onChanged: (value) {
        debugPrint('input:$value');
      },
      //点击提交时候
      onSubmitted: (value) {
        debugPrint('submint:$value');
      },
      decoration: InputDecoration(
        //添加图片
        icon: Icon(Icons.subject),
        //添加标题
        labelText: 'Title',
        //提示内容
        hintText: 'Enter the post title.',
        //去除下方边框
        //border: InputBorder.none,
        //添加加四周边框
        //border: OutlineInputBorder(),
        //添加背景颜色的
        filled: true,
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
    );
  }
}
