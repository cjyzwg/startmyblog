import 'package:flutter/material.dart';
import 'package:startmyapp/demo/blog_show.dart';
import '../model/blog.dart';


class BlogList extends StatefulWidget {
  @override
  BlogListState createState() => new BlogListState();
}

class BlogListState extends State<BlogList> {
  

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildLists());
  }

  Widget _buildLists() {
    return new ListView.builder(
        itemCount: bloglists.length, itemBuilder: _blogsCellBuilder);
  }

  Widget _blogsCellBuilder(BuildContext context, int index) {
    return Container(
      height: 115.0,
      child: Column(
        children: <Widget>[
          // 内容视图
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        bloglists[index].description,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xff111111),
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        width: 50.0,
                        height: 20.0,
                        margin: EdgeInsets.only(top: 6),
                        color: Colors.purple,
                        child: ButtonTheme(
                          buttonColor: Colors.purple,
                          shape: StadiumBorder(),
                          child: RaisedButton(
                            // onPressed: () => print("test"),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      BlogShow(blog: bloglists[index])));
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
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
          ),
          // 分割线
          Container(
            margin: EdgeInsets.only(top: 4.0),
            color: Color(0xffeaeaea),
            constraints: BoxConstraints.expand(height: 4.0),
          )
        ],
      ),
    );
  }
}
