import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
class HttpDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
      ),
      body:HttpDemoHome()
    );
  }
}
class HttpDemoHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HttpDemoHomeState();
  }
}
class _HttpDemoHomeState extends State<HttpDemoHome>{

  @override
  void initState() {
    super.initState();
    //调用网络请求
    //fectchPosts().then((value) => print(value));

//    final post = {
//      'title':'hello',
//      'description':'nice to meet you.',
//    };
//    print(post['title']);
//    print(post['description']);
//    //转换成json格式
//    final postJson = json.encode(post);
//    print(postJson);
//    //转换成map类型的数据
//    final postJsonConverted = json.decode(postJson);
//    print(postJsonConverted['title']);
//    print(postJsonConverted['description']);
//    //使用model类
//    final postModel = Post.fromJson(postJsonConverted);
//    print('title:${postModel.title}');
//    print('title:${postModel.description}');
//    //自动调用 toJson
//    print('${json.encode(postModel)}');
  }

  Future<List<Post>> fectchPosts()async{
    final response = await http.get('https://resources.ninghao.net/demo/posts.json');
    if(response.statusCode == 200){
      final responseBody = json.decode(response.body);
      List<Post> posts = responseBody['posts'].map<Post>((item) =>Post.fromJson(item)).toList();
      return posts;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fectchPosts(),
      builder: (BuildContext context,AsyncSnapshot snapshot){
        print('data:${snapshot.data}');
        print('data:${snapshot.connectionState}');
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: Text('loading'),
          );
        }
        return ListView(
          children: snapshot.data.map <Widget>(
            (item) {
              return ListTile(
                title: Text(item.title),
                subtitle: Text('123'),
              );
            }
        ).toList(),
        );
      },
    );
  }
}

class Post{
  final String title;
  final String description;
  Post(
    this.title,
    this.description);
  Post.fromJson(Map json):title = json['title'],description = json['description'];
  Map toJson() => {
        'title' :  title,
        'description' : description,
      };

}
