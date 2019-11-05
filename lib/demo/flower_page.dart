import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../model/blog1_model.dart';
import './blog1_show.dart';
import '../config.dart';

class BlogCard extends StatelessWidget {
  final Blog bloglist;

  BlogCard(this.bloglist);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
          title: Text(
            bloglist.title,
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          subtitle: Text(bloglist.category),
          trailing: Container(
            width: 50.0,
            height: 20.0,
            margin: EdgeInsets.only(top: 6.0),
            child: ButtonTheme(
              buttonColor: Colors.purple,
              shape: StadiumBorder(),
              child: RaisedButton(
                // onPressed: () => print('test'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlogShow(blog: bloglist)));
                },
                padding: EdgeInsets.all(2.0),
                child: Text(
                  '阅读全文',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.0,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          )),
    );
  }
}

class BlogSheet extends StatefulWidget {
  // BlogSheet({Key key, this.title}) : super(key: key);
  final String title;
  BlogSheet(this.title);

  @override
  _BlogSheetState createState() => _BlogSheetState();
}

class _BlogSheetState extends State<BlogSheet> {
  List bloglists;

  @override
  void initState() {
    super.initState();

    getData(type: 'api', category: widget.title);
    // postData();
  }

  Future getData({String type = 'api', String category = 'PHP'}) async {
    final String url = UrlConfig.url+"/$type?category=$category";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List top = json.decode(response.body);
      setState(() {
        bloglists = top.map((json) => Blog.fromJson(json)).toList();
      });
    } else {
      print("err code $response.statusCode");
    }
  }

  Future postData({String type = 'api'}) async {
    final String url = UrlConfig.url+"/$type";
    final response = await http.post(url);

    if (response.statusCode == 200) {
      List top = json.decode(response.body);
      setState(() {
        bloglists = top.map((json) => Blog.fromJson(json)).toList();
      });
    } else {
      print("err code $response.statusCode");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: bloglists == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
              child: ListView.builder(
                itemCount: bloglists.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = bloglists[index];
                  return Dismissible(
                    // 滑动背景色
                    background:
                        new Container(color: Theme.of(context).primaryColor),
                    // 设置key标识
                    key: new Key(item.title),
                    // 滑动回调
                    onDismissed: (direction) async {
                      final String type = 'del';
                      final String category = item.category;
                      final String name = item.title;
                      // final String url ="http://localhost:8081/$type?category=$category&name=$name";
                      final String url = UrlConfig.url+"/$type?category=$category&name=$name";
                      final response = await http.get(url);
                      if (response.statusCode == 200) {
                        print("the right code ");
                        // 根据位置移除
                        bloglists.removeAt(index);

                        //do something

                        // 提示
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text("已移除")));
                      } else {
                        print("err code $response.statusCode");
                      }
                    },
                    child: BlogCard(bloglists[index]),
                  );
                  // return BlogCard(bloglists[index]);
                },
              ),
            ),
    );
  }
}
