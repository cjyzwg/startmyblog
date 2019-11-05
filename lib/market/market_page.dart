import 'package:flutter/material.dart';

class MarketPage extends StatefulWidget {

  @override
  _MarketPageState createState() => new _MarketPageState();

}

class _MarketPageState extends State<MarketPage> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('市场'),
          ),
          body: new Center(
              child: null
          ),
        ),
        theme: ThemeData(primaryColor: Colors.purple),
    );
  }

}