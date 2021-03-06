import 'package:flutter/material.dart';
import 'dart:async';
class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('StreamDemo'),
        elevation: 0.0,
      ),
      body:StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;
  String _data = '...';

  @override
  void dispose() {
    _streamDemo.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print('create a stream');
    _streamDemo = StreamController.broadcast();
    _sinkDemo = _streamDemo.sink;
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    print('listening a stream');
    _streamDemoSubscription = _streamDemo.stream.listen(onData,onError: onError,onDone:onDone);
    _streamDemo.stream.listen(onDataTwo,onError: onError,onDone:onDone);
    print('Initial completed');
  }
  void onData(String data){
    print ('$data');
    setState(() {
      _data = data;
    });
  }
  void onDataTwo(String data){
    print ('onDataTwo:$data');
  }
  void onDone(){
    print('Done!');
  }
  void onError(error){
    print('Error:$error');
  }
  void _pauseStream(){
    print('pause subscription');
    _streamDemoSubscription.pause();
  }
  void _resumeStream(){
    print('resume subscription');
    _streamDemoSubscription.resume();
  }
  void _cancelStream(){
    print('cancle subscription');
    _streamDemoSubscription.cancel();
  }
  void _addDataToStream() async{
    print('Add data to stream.');
    String data = await fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }
  Future<String> fetchData() async{
    await Future.delayed(Duration(seconds:5));
    // throw 'Something happened';
    return 'hello ~';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(_data),
            StreamBuilder(
              stream:_streamDemo.stream,
              initialData: '...',
              builder: (context , snapshot){
                return Text('${snapshot.data}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: _addDataToStream,
                ),
                FlatButton(
                  child: Text('Pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('Cancle'),
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}