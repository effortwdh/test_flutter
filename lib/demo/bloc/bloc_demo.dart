import 'dart:async';

import 'package:flutter/material.dart';
class BlocDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlocDemo'),
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}
class CounterHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return Center(
      child:StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context,snapshot){
          return  ActionChip(
            label: Text('0'),
            onPressed: (){
              //_counterBloc.log();
              _counterBloc.counter.add(1);
            },
          );
        },
      ),
    );
  }
}
class CounterActionButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
      child: Icon(Icons.title),
      onPressed: (){},
    );
  }
}
class CounterBloc{
  int _count = 0;
  final _counterActionControllortest = StreamController<int>();
  StreamSink<int> get counter => _counterActionControllortest.sink;

  final _counterController = StreamController<int>();
  Stream<int>get count => _counterActionControllortest.stream;
  CounterBloc(){
    _counterActionControllortest.stream.listen(onData);
  }
  void onData(int data){
    print('$data');
    _count = data+_count;
    _counterController.add(_count);
  }
  void disponse(){
    _counterActionControllortest.close();
    _counterController.close();
  }
  void log(){
    print('log');
  }
}

class CounterProvider extends InheritedWidget{
  final Widget child;
  final CounterBloc bloc;
  CounterProvider({
    this.child,
    this.bloc,
}):super(child:child);

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);
  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

//class BlocDemoHome extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    return _BlocDemoHomeStatus();
//  }
//}
//class _BlocDemoHomeStatus extends State<BlocDemoHome>{
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}