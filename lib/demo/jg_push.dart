
import 'package:flutter/material.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import '../config.dart';



class JpushPage extends StatefulWidget {
  JpushPage({Key key}) : super(key: key);

  _JpushPageState createState() => _JpushPageState();
}

class _JpushPageState extends State<JpushPage> {
  @override
  void initState() {
    super.initState();
    this.initJpush();
  }

  //监听极光推送 (自定义的方法)
  //https://github.com/jpush/jpush-flutter-plugin/blob/master/documents/APIs.md
  initJpush() async {
    JPush jpush = new JPush();
    //获取注册的id
    jpush.getRegistrationID().then((rid) {
      print("获取注册的id:$rid");
    });
    //初始化
    jpush.setup(
      appKey: UrlConfig.jiguangapikey,
      channel: "theChannel",
      production: false,
      debug: true, // 设置是否打印 debug 日志
    );

    //设置别名  实现指定用户推送
    jpush.setAlias("jg123").then((map) {
      print("设置别名成功");
    });

    

    try {
      //监听消息通知
      jpush.addEventHandler(
        // 接收通知回调方法。
        onReceiveNotification: (Map<String, dynamic> message) async {
          print("flutter onReceiveNotification: $message");
        },
        // 点击通知回调方法。
        onOpenNotification: (Map<String, dynamic> message) async {
          print("flutter onOpenNotification: $message");
        },
        // 接收自定义消息回调方法。
        onReceiveMessage: (Map<String, dynamic> message) async {
          print("flutter onReceiveMessage: $message");
        },
      );
    } catch (e) {
      print('极光sdk配置异常');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("极光推送demo"),
      ),
      body: Text("这是一个极光推送演示demo"),
    );
  }
}