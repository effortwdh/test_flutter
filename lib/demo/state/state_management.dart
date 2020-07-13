import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
//无变化状态的小部件 数据需要声明成final
//class StateManagementDemo extends StatelessWidget{
//  final int count = 0;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('StateManagementDemo'),
//        elevation: 0.0,
//      ),
//      body: Center(
//        child: Chip(
//          label: Text('$count'),
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: () {
//          print(count);
//        },
//      ),
//    );
//  }
//}
//带变化的小部件
class StateManagementDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _StateManagementDemoState();
  }
}
//每一次调用setState会使用新的状态
class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;
  //回调函数的具体内容
  void _increaseCount(){
    //带变化的值
    setState(() {
      _count+=1;
    });
    print(_count);
  }
  @override
  Widget build(BuildContext context) {
    //使用直线 继承 传递数据
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('StateManagementDemo'),
//        elevation: 0.0,
//      ),
//      body:CounterWrapper(_count,_increaseCount),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed:_increaseCount
//      ),
//    );
   //使用 InheritedWidget
    return CounterProvider(
      //数据已经提供好了 在子构件树中都可以调用
      count: _count,
      increateCount: _increaseCount,
      child: Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo'),
        elevation: 0.0,
      ),
      body:CounterInheritedWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:_increaseCount
      ),
      )
    );

  }
}
class CounterInheritedWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //值从CounterProvider传递过来的 注意 要在bulid方法里面
    final int count = CounterProvider.of(context).count;
    //设置回调 为了执行子类的onPressed方法
    final VoidCallback increaseCount = CounterProvider.of(context).increateCount;
    return
      ActionChip(
        label: Text('$count'),
        onPressed:increaseCount,
      );
  }
}
class CounterWrapper extends StatelessWidget{
  //值从上方传递过来的
  final int count;
  //设置回调 为了执行子类的onPressed方法
  final VoidCallback increaseCount;
  CounterWrapper(this.count,this.increaseCount);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(count, increaseCount),
    );
  }
}
class Counter extends StatelessWidget{
  //值从上方传递过来的
  final int count;
  //设置回调 为了执行子类的onPressed方法
  final VoidCallback increaseCount;

  Counter(this.count,this.increaseCount);
  @override
  Widget build(BuildContext context) {
    return
      ActionChip(
        label: Text('$count'),
        onPressed:increaseCount,
      );
  }
}
//使用InheritedWidget 来跨类传递数据
class CounterProvider extends InheritedWidget{
  final int count;
  final VoidCallback increateCount;
  final Widget child;
  CounterProvider({
    this.count,
    this.child,
    this.increateCount,
}):super(child:child);
  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
//使用 scoped_modelq
class StateManagementDemo2  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //使用 ScopedModelModel
    return ScopedModel(
      //数据已经提供好了 在子构件树中都可以调用
        model: CounterModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('StateManagementDemo'),
            elevation: 0.0,
          ),
          body:CounterModelCenter(),
          floatingActionButton: ScopedModelDescendant<CounterModel>(
            rebuildOnChange: false,
            builder: (context,_,model) => FloatingActionButton(
                child: Icon(Icons.add),
                onPressed:model.increateCount,
            ),
          ),
        )
    );
  }
}
class CounterModel extends Model{
  int _count = 0;
  int get count =>_count;
  void increateCount(){
    _count +=1;
    notifyListeners();
  }
}
class CounterModelCenter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context,_,model) => ActionChip(
        label: Text('${model.count}'),
        onPressed:model.increateCount,
      ),
    );
  }
}