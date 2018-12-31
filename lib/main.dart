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
      home: new ShoppingList(
        products: <Product>[
          new Product(name: 'Eggs'),
          new Product(name: 'Flour'),
          new Product(name: 'Chocolate chips'),
        ],
      ),
    );
  }
}

class Product {
  const Product({this.name});

  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
    Product product,
    this.inCart,
    this.onCartChanged,
  })  : product = product,
        super(key: new ObjectKey(product));

  // 该ShoppingListItem widget是无状态的。它将其在构造函​​数中接收到的值存储在final成员变量中，然后在build函数中使用它们。
  // 例如，inCart布尔值表示在两种视觉展示效果之间切换：一个使用当前主题的主色，另一个使用灰色
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  // 头像的颜色 选中黑色，未选中就是主题颜色
  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {  // item的点击事件
        onCartChanged(product, !inCart);  // 回调到父控件（widget)）
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),  // 头像中间是标题的首字母
      ),
      title: new Text(product.name, style: _getTextStyle(context)),
    );
  }
}

// ListView
class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {  //  会为State对象触发build()方法，从而导致对UI的更新
      print("ListItem 点击 回调");
      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shopping List'),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) { // 某一个item回调
          return new ShoppingListItem(
            product: product,  // 哪一个item
            inCart: _shoppingCart.contains(product),  // 数据集合中是否包含这个 itemData,包含返回true，不包含返回false
            onCartChanged: _handleCartChanged,  // ListItem 回调
          );
        }).toList(),
      ),
    );
  }
}
