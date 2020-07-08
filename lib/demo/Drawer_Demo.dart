import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //设置padding的大小
        padding: EdgeInsets.zero,
        children: <Widget>[
          //设置抽屉Header文本内容
          // DrawerHeader(
          //   child: Text('header'.toUpperCase()),
          //   decoration: BoxDecoration(color: Colors.grey[100]),
          // ),
          //设置用户信息 抽屉头
          UserAccountsDrawerHeader(
            //用户名称
            accountName: Text(
              '敦豪',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //用户email
            accountEmail: Text('2318007313@qq.com'),
            //用户头像
            currentAccountPicture:
                //使用圆形 修改背景图片
                CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2730021372,1817015653&fm=26&gp=0.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              image: DecorationImage(
                image: NetworkImage(
                    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1594201291956&di=226428dccde859952b741f38acf9521a&imgtype=0&src=http%3A%2F%2Fpic25.nipic.com%2F20121116%2F9252150_144336550000_2.jpg'),
                //图片拉伸覆盖
                fit: BoxFit.cover,
                //添加滤镜
                colorFilter: ColorFilter.mode(
                    Colors.yellow[400].withOpacity(0.6), BlendMode.hardLight),
              ),
            ),
          ),
          //设置list文本内容
          ListTile(
            title: Text(
              'Messages',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.message,
              color: Colors.black12,
              size: 22,
            ),
            //关闭打开的抽屉
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              'Favorite',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.favorite,
              color: Colors.black12,
              size: 22,
            ),
          ),
          ListTile(
            title: Text(
              'Messages',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.settings,
              color: Colors.black12,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
