import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import '../model/category.dart';
import './flower_page.dart';
import './editor_page.dart';
import '../config.dart';

class FlowerDemo extends StatelessWidget {
  final Category categorylist;

  FlowerDemo(this.categorylist);
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: CustomScrollView(
    //     slivers: <Widget>[
    //       SliverSafeArea(
    //         sliver: SliverPadding(
    //             padding: EdgeInsets.all(8.0), sliver: FlowerSheet()),
    //       ),
    //     ],
    //   ),
    // );
    return Container(
      decoration: BoxDecoration(
          color: Colors.purple,
          image: DecorationImage(
            image: NetworkImage(categorylist.imageUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.purple[200].withOpacity(0.6), BlendMode.hardLight),
          )),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          MaterialButton(
              child: Text(
                categorylist.category,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black87),
              ),
              onPressed: () {
                // print("tets");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Page(title: categorylist.category)));
              }),
        ],
      ),
    );
  }
}

class FlowerSheet extends StatefulWidget {
  @override
  _FlowerSheetState createState() => _FlowerSheetState();
}

class _FlowerSheetState extends State<FlowerSheet> {
  // FocusScopeNode focusScopeNode;
  List categorylists;

  @override
  void initState() {
    super.initState();

    getData(type: 'api');
    // postData();
  }

  Future getData({String type = 'api'}) async {
    final String url = UrlConfig.url+"/$type";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List top = json.decode(response.body);
      setState(() {
        categorylists = top.map((json) => Category.fromJson(json)).toList();
      });
    } else {
      print("err code $response.statusCode");
    }
  }

  @override
  Widget build(BuildContext context) {
    // FocusScope.of(context).requestFocus(FocusNode());
    // final len = categorylists.length;
    // print("length: $len");
    //注意这里categorylists 可能还没获取到。
    return Scaffold(
      body: categorylists == null
          ? Container()
          : CustomScrollView(
              slivers: <Widget>[
                SliverSafeArea(
                  sliver: SliverPadding(
                      padding: EdgeInsets.all(8.0),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 1.0,
                        ),
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return FlowerDemo(categorylists[index]);
                        }, childCount: categorylists.length),
                      )),
                )
              ],
            ),
    );
    // return SliverGrid(
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     crossAxisSpacing: 8.0,
    //     mainAxisSpacing: 8.0,
    //     childAspectRatio: 1.0,
    //   ),
    //   delegate: SliverChildBuilderDelegate(
    //     (BuildContext context, int index) {
    //       return Container(
    //         decoration: BoxDecoration(
    //             color: Colors.purple,
    //             image: DecorationImage(
    //               image: NetworkImage(categorylists[index].imageUrl),
    //               fit: BoxFit.cover,
    //               colorFilter: ColorFilter.mode(
    //                   Colors.purple[200].withOpacity(0.6), BlendMode.hardLight),
    //             )),
    //         child: Stack(
    //           alignment: Alignment.center,
    //           children: <Widget>[
    //             MaterialButton(
    //                 child: Text(
    //                   categorylists[index].category,
    //                   style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 15,
    //                       color: Colors.black87),
    //                 ),
    //                 onPressed: () {
    //                   Navigator.of(context).push(MaterialPageRoute(
    //                       builder: (context) =>
    //                           Page(title: categorylists[index].category)));
    //                 }),
    //           ],
    //         ),
    //       );
    //     },
    //     childCount: categorylists.length,
    //   ),
    // );
  }
}

// class SliverGridDemo extends StatelessWidget {
//   final Category categorylists;

//   SliverGridDemo(this.categorylists);
//   @override
//   Widget build(BuildContext context) {
//     return SliverGrid(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 8.0,
//         mainAxisSpacing: 8.0,
//         childAspectRatio: 1.0,
//       ),
//       delegate: SliverChildBuilderDelegate(
//         (BuildContext context, int index) {
//           return Container(
//             decoration: BoxDecoration(
//                 color: Colors.purple,
//                 image: DecorationImage(
//                   image: NetworkImage(categories[index].imageUrl),
//                   fit: BoxFit.cover,
//                   colorFilter: ColorFilter.mode(
//                       Colors.purple[200].withOpacity(0.6), BlendMode.hardLight),
//                 )),
//             child: Stack(
//               alignment: Alignment.center,
//               children: <Widget>[
//                 MaterialButton(
//                     child: Text(
//                       categories[index].category,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                           color: Colors.black87),
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) =>
//                               Page(title: categories[index].category)));
//                     }),
//               ],
//             ),
//           );
//           // return Container(
//           //   child: Stack(
//           //     alignment: Alignment.center,
//           //     children: <Widget>[
//           //       Image.network(
//           //         posts[index].imageUrl,
//           //         fit: BoxFit.cover,
//           //       ),
//           //       Text(posts[index].author,
//           //       style: TextStyle(
//           //         fontSize: 13,
//           //         color: Colors.black87
//           //       ),

//           //       ),
//           //     ],
//           //   ),
//           // );
//         },
//         childCount: categories.length,
//       ),
//     );
//   }
// }

class Page extends StatelessWidget {
  final String title;

  Page({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: () {
          // Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EditorPage(cate: title)));

        },
      ),
      body: BlogSheet(title),
    );
  }
}

class EditorPage extends StatelessWidget {
  final String cate;

  EditorPage({this.cate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("编辑博客"),
      //   elevation: 0.0,
      // ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     // Navigator.pop(context);
      //     Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => EditorPage(cate: cate)));

      //   },
      // ),
      body: IssuesMessagePage(cate),
    );
  }
}
