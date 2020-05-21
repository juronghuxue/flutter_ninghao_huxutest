import 'dart:async';

import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.Of(context).bloc;
    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream:_counterBloc.count,
        builder: (context,snapshot){
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: (){
              _counterBloc.log();
            },
          );
        },
      )
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.Of(context).bloc;
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){
        // _counterBloc.log();
        _counterBloc.counter.add(1);
      },
    );
  }
}

class CounterProvider extends InheritedWidget{
  final Widget child;
  final CounterBloc bloc;

  CounterProvider({
    this.child,
    this.bloc,
  }):super(child:child);

  static CounterProvider Of(BuildContext context)=>
    context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

}

class CounterBloc{
  int _count = 0;
  final _countActionController = StreamController<int>();
  StreamSink<int> get counter => _countActionController.sink;
  final _countController = StreamController<int>();
  Stream<int> get count => _countController.stream;

  CounterBloc(){
    _countActionController.stream.listen(onData);
  }
  void onData(int data){
    _count  = data+_count;
    _countController.add(_count);
    print('$data');
  }
  void disponse(){
    _countActionController.close();
    _countController.close();
  }
  void log(){
    print('BloC');
  }
}