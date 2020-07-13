import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0,
      ),
      body: StatemDemoHome(),
    );
  }
}
class StatemDemoHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StatemDemoHomeState();
  }
}
class _StatemDemoHomeState extends State<StatemDemoHome>{
  //为了暂停、恢复、取消监听
  StreamSubscription _streamDemoSubscription;
  //控制
  StreamController<String> _streamDemo;
  //水槽 水池
  StreamSink _sinkDemo;
  //Text显示数据
  String _data = '。。。';
  @override
  void dispose() {
  _streamDemo.close();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    print('create a stream');
    //使用StreamController
    //_streamDemo = StreamController<String>();
    //可以多个订阅
    _streamDemo = StreamController.broadcast();
    _sinkDemo = _streamDemo.sink;
    _streamDemoSubscription = _streamDemo.stream.listen(onData,onError: onError,onDone: onDone);
    //可以多个订阅
    _streamDemoSubscription = _streamDemo.stream.listen(onDataTwo,onError: onError,onDone: onDone);

    //Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    //监听 时候还没有数据
    print('Start listening on a stream');
    //对应接受到数据，错误，完成 时的方法
    //_streamDemoSubscription = _streamDemo.listen(onData,onError: onError,onDone: onDone);



    print('Initialize completed.');
  }
  void onData(String data){
    setState(() {
      _data = data;
    });
    print('$data');
  }
  void onDataTwo(String data){
    print('onDataTwo:$data');
  }
  void onError(error){
    print('Error:$error');
  }
  void onDone(){
    print('Done!');
  }
  Future<String> fetchData() async{
    await Future.delayed(Duration(seconds: 3));
    //模拟发生错误
    //throw 'something happended';
    return 'hello ~';
  }
  void _pauseStream(){
    print('Pause subscription');
    _streamDemoSubscription.pause();
  }
  void _resumeStream(){
    print('Pause subscription');
    _streamDemoSubscription.resume();
  }
  void _cancelStream(){
    print('Pause subscription');
    _streamDemoSubscription.cancel();
  }
  void _addDataTOStream()async{
    print('Add data to stream');

    String data = await fetchData();
    //_streamDemo.add(data);
    _sinkDemo.add(data);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Text(_data),
            //根据值构建小部件
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',
              builder: (context,snapshot){
                return Text('${snapshot.data}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: _cancelStream,
                ),
                FlatButton(
                  child: Text('Add'),
                  onPressed: _addDataTOStream,
                ),
              ],
            ),
          ],
        )

      ),
    );
  }
}