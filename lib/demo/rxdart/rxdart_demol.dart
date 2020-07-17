import 'package:flutter/material.dart';
import 'package:ninghao_flutter/main.dart';
import 'package:rxdart/rxdart.dart';
class RxdartDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxdartDemo'),
      ),
      body: RxdartDemoHome(),
    );
  }
}
class RxdartDemoHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RxdartDemoHomeStatus();
  }
}
class _RxdartDemoHomeStatus extends State<RxdartDemoHome>{
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}