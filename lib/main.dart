import 'package:flutter/material.dart';
// import './demo/home.dart';
import './index/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hello",
      home: Index(),
      // home: RandomWords(),
      // theme: ThemeData(primaryColor: Colors.purple),
      // debugShowCheckedModeBanner: false,
    );
  }
}

// class RandomWords extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     return new RandomWordsState();
//   }
// }
