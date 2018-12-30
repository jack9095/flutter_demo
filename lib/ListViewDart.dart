import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
//    return new MaterialApp(
//      title: 'Welcome to Flutter',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
//          child: new Text(wordPair.asPascalCase),
//        ),
//      ),
//    );


    // 添加外部包
//    return new MaterialApp(
//      title: 'Welcome to Flutter',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
//          //child: new Text(wordPair.asPascalCase),
//          child: new RandomWords(),
//        ),
//      ),
//    );


    // ListView 列表
    return new MaterialApp(
      title: '第一个 ListView 列表',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new RandomWords(),
    );

  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  final _save = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);

    return new Scaffold (
      appBar: new AppBar(
        title: new Text('第一个 ListView 列表'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){

    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该行书湖添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context,i){
          // 在每一列之前，添加一个1像素高的分隔线widget
          if(i.isOdd) return new Divider();
          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;

          // 如果是ListView列表中最后一个单词对
          if(index >= _suggestions.length){
            // ...接着再生成10个单词对，然后添加到ListView列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair){
    final alreadySaved = _save.contains(pair);
    return new ListTile(
      // ListView中item上的文字
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),

      // ListView中item上的图标
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.green : null,
      ),

      // ListView中item上的点击交互事件
      onTap: (){
        setState(() {  // 在Flutter的响应式风格的框架中，调用setState() 会为State对象触发build()方法，从而导致对UI的更新
          if (alreadySaved) {
            _save.remove(pair);
          } else {
            _save.add(pair);
          }
        });
      },

    );
  }

  // 导航栏图标点击调用的函数
  void _pushSaved(){
    Navigator.of(context).push(
      // 新页面的内容在在MaterialPageRoute的builder属性中构建，builder是一个匿名函数
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _save.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          // builder返回一个Scaffold，其中包含名为“Saved Suggestions”的新路由的应用栏。 新路由的body由包含ListTiles行的ListView组成; 每行之间通过一个分隔线分隔
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('第一个ListView中保存的数据'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

}
