import 'package:dio/dio.dart';
// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:zefyr/zefyr.dart';
import 'package:notus/convert.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../config.dart';




class IssuesMessagePage extends StatefulWidget {
  @override
  _IssuesMessagePageState createState() => _IssuesMessagePageState();
}

class _IssuesMessagePageState extends State<IssuesMessagePage> {
  final TextEditingController _controller = new TextEditingController();
  final ZefyrController _zefyrController = new ZefyrController(NotusDocument());
  final FocusNode _focusNode = new FocusNode();
  String _title = "";
  var _delta;
  var json;
  String string;
  var plainText;

  @override
  void initState() {
    _controller.addListener(() {
      print("_controller.text:${_controller.text}");
      setState(() {
        _title = _controller.text;
      });
    });

    _zefyrController.document.changes.listen((change) {
      setState(() {
        _delta = _zefyrController.document.toDelta();
        json = _zefyrController.document.toJson();
        string = _zefyrController.document.toString();
        plainText = _zefyrController.document.toPlainText();
      });
    });

    super.initState();
  }

  void dispose() {
    _controller.dispose();
    _zefyrController.dispose();
    super.dispose();
  }

  _submit() async {
    print("==============================");
    print("_delta:$_delta");
    print("json:$json");
    print("string:$string");
    print("plainText:$plainText");
    String mk = notusMarkdown.encode(_delta);
    print("mk:$mk");
    if (_title.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: '标题不能为空',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Theme.of(context).primaryColor,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
        Dio _dio = Dio(BaseOptions(
        baseUrl: UrlConfig.url,
        connectTimeout: 10000,
        receiveTimeout: 10000));
        var url = "/savedocument";
        FormData _formData = FormData.from({
          "category":"PHP",
          "title": _title,
          "body": mk,
        });
        _dio.post(url, data: _formData).then((Response response) {
          if (response.statusCode == 200) {
            print(response.data.toString());
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Saved.")));

          }
        }).catchError((error) {
          print(error.toString());
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("failed to save.")));
        });
        
        // var directory = Directory("/Users/cj/Documents/code/flutterios/startmyapp/lib/demo");
      
        // File file = File(directory.absolute.path+"/$_title.md");
        // print(file);
        //  //如果文件存在，删除
        // if(!await file.exists()) {
        //   //创建文件
        //   file = await file.create();
        // }
        
    
        // file.writeAsString(mk).then((_) {
        //   Scaffold.of(context).showSnackBar(SnackBar(content: Text("Saved.")));
        // });

     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('编辑博客'),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                _submit();
              },
              icon: Icon(
                Icons.near_me,
                color: Colors.white,
                size: 12,
              ),
              label: Text(
                '保存',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
          elevation: 1.0,
        ),
        body: ZefyrScaffold(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListView(
              children: <Widget>[            
                Text('输入标题：'),
                new TextFormField(
                  maxLength: 50,
                  controller: _controller,
                  decoration: new InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                Text('内容：'),
                _descriptionEditor(),
              ],
            ),
          ),
        ));
  }

  Widget _descriptionEditor() {
    final theme = new ZefyrThemeData(
      toolbarTheme: ZefyrToolbarTheme.fallback(context).copyWith(
        color: Colors.grey.shade800,
        toggleColor: Colors.grey.shade900,
        iconColor: Colors.white,
        disabledIconColor: Colors.grey.shade500,
      ),
    );

    return ZefyrTheme(
      data: theme,
      child: ZefyrField(
        height: 400.0,
        decoration: InputDecoration(labelText: 'Description'),
        controller: _zefyrController,
        focusNode: _focusNode,
        autofocus: true,
        physics: ClampingScrollPhysics(),
      ),
    );
  }
}

