import 'package:flutter/material.dart';
import '../model/blog1_model.dart';
import 'package:flutter_markdown/flutter_markdown.dart';



class BlogShow extends StatelessWidget {
  final Blog blog;
  
  BlogShow({
    @required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${blog.title}'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(blog.imageUrl),
            Container(
              // padding: EdgeInsets.all(32.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('${blog.title}',
                      style: Theme.of(context).textTheme.title,
                      textAlign: TextAlign.center),
                  SizedBox(height: 12.0),
                  Text('分类:${blog.category} ' + ' 发布时间:${blog.posttime}',
                      style: Theme.of(context).textTheme.subhead),
                  SizedBox(height: 32.0),
                  MarkdownBody(data:blog.content)
                  // Text(
                  //   '${blog.content}',
                  //   style: Theme.of(context).textTheme.body1,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
