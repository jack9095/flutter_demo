import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
      title: 'Welcome to Flutter',
      home: new MyMaterial(),
    );
  }
}


class MyMaterial extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Material(
      // Column is 垂直方向的线性布局.
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              "Example title",
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
            child: new Center(
              child: new Text("hello woord"),
            ),
          ),
        ],
      ),
    );
  }

}


class MyAppBar extends StatelessWidget{

  MyAppBar({this.title});

  // Widget子类中的字段往往都会定义为"final"
  final Widget title;
  @override
  Widget build(BuildContext context) {
    // Container 可让您创建矩形视觉元素
    return new Container(
      height: 60.0,  // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.red),
      // Row 是水平方向的线性布局（linear layout）
      child: new Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: "Navigation menu",
            onPressed: null, // null 会禁用 button
          ),
          new Expanded(
            child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: "search",
            onPressed: null,
          ),
        ],
      ),
    );
  }

}