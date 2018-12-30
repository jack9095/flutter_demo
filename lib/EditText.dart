import 'package:flutter/material.dart';

//void main() => runApp(new MyScaffold());
void main() {
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new MyScaffold(),
  ));
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter GestureDetector',
      home: new TutorialHome(),
    );
  }
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: "Navigation menu",
            onPressed: null),
        title: new Text("GestureDetector title"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search), tooltip: "search", onPressed: null),
        ],
      ),

      //body占屏幕的大部分
      body: new Center(
        child: new Counter(),
      ),

      floatingActionButton: new IconButton(
          icon: new Icon(Icons.add), tooltip: "add", onPressed: null),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() {
    return new _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    // 在Flutter的响应式风格的框架中，调用setState() 会为State对象触发build()方法，从而导致对UI的更新
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        // 点击事件
        new RaisedButton(
          onPressed: _increment,
          child: new Text("Increment"),
        ),
        new Text("Count:$_counter"),
      ],
    );
  }
}