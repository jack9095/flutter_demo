import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(
  new Center(
    child: new Text(
      "哈哈",
      style: TextStyle(fontSize: 18.0),
      textDirection: TextDirection.ltr,
    ),
  )
);

class Test extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "测试",
      theme: new ThemeData(
        primaryColor: Colors.green
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("这是一个测试"),
        ),
        body: new Center(
          child: new Text("居中显示"),
        ),
      ),
    );
  }

}