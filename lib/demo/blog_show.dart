import 'package:flutter/material.dart';
import '../model/blog.dart';

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
      body: Column(
        children: <Widget>[
          Image.network(blog.imageUrl),
          Container(
            padding: EdgeInsets.all(32.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${blog.title}', style: Theme.of(context).textTheme.title),
                Text('${blog.category}',
                    style: Theme.of(context).textTheme.subhead),
                SizedBox(height: 32.0),
                Text('${blog.description}',
                    style: Theme.of(context).textTheme.body1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
