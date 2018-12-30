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

class TutorialHome extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.menu), tooltip: "Navigation menu", onPressed: null),
        title: new Text("GestureDetector title"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), tooltip: "search", onPressed: null),
        ],
      ),

      //body占屏幕的大部分
      body: new Center(
        child: new MyButton(),
      ),

      floatingActionButton: new IconButton(icon: new Icon(Icons.add),tooltip: "add", onPressed:null),
    );
  }

}

// 在body中居中显示
class MyButton extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: (){
        print('flutter的手势点击事件');
      },
      child: new Container(
        height: 56,
        padding: new EdgeInsets.all(8.0),
        margin: new EdgeInsets.symmetric(horizontal: 6.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(4.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text("手势监听"),
        ),
      ),
    );
  }

}