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
      title: 'Flutter Tutorial',
      home: new TutorialHome(),
    );
  }
}

class TutorialHome extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.menu), tooltip: "Navigation menu", onPressed: null),
        title: new Text("Example title"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), tooltip: "search", onPressed: null),
        ],
      ),

      //body占屏幕的大部分
      body: new Center(
        child: new Text("这是一个简单的 Material 案例"),
      ),

      floatingActionButton: new IconButton(icon: new Icon(Icons.add),tooltip: "add", onPressed:null),
    );
  }

}