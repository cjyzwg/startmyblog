import 'dart:io';

import 'package:dio/dio.dart';

class DartHttpUtils {
  //配置dio，通过BaseOptions
  Dio _dio = Dio(BaseOptions(
      // baseUrl: "http://localhost:8081/",
      baseUrl: "http://www.site1.com/wechat",
      connectTimeout: 5000,
      receiveTimeout: 5000));

  //dio的GET请求
  getDio() async {

    var url = "/api.php?v=1&api=edit1&p={'action':'get_user_menus'}&authkey=ynKTaMcUMAaTakgjkkqygACIG65Yjk52TtqzC7rgdHDucHe8fFcb+eTeM/2uhz7fPV0JlgM/+Gox";
    _dio.get(url).then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    });
  }

  getUriDio() async {
    var url = "/path1?name=abc&pwd=123";
    _dio.getUri(Uri.parse(url)).then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

//dio的GET请求，通过queryParameters配置传递参数
  getParametersDio() async {
    var url = "/api";
    _dio.get(url, queryParameters: {
      "category":"PHP"
      }).then(
        (Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
        return response.data;
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

//发送POST请求，application/x-www-form-urlencoded
  postUrlencodedDio() async {
    var url = "/path2";
    _dio
        .post(url,
            data: {"name": 'value1', "pwd": 123},
            options: Options(
                contentType:
                    ContentType.parse("application/x-www-form-urlencoded")))
        .then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  //发送POST请求，application/json
  postJsonDio() async {
    var url = "/test61.php";
    _dio
        .post(url,
            data: {"name": 'value1', "pwd": 123},
            options: Options(contentType: ContentType.json))
        .then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  // 发送POST请求，multipart/form-data
  postFormDataDio() async {
    var url = "/path4";
    FormData _formData = FormData.from({
      "name": "value1",
      "pwd": 123,
    });
    _dio.post(url, data: _formData).then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  // 发送POST请求，multipart/form-data，上传文件
  postFileDio() async {
    var url = "/path5";
    FormData _formData = FormData.from({
      "description": "descriptiondescription",
      "file": UploadFileInfo(File("./example/upload.txt"), "upload.txt")
    });
    _dio.post(url, data: _formData).then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  //dio下载文件
  downloadFileDio() {
    var urlPath = "https://abc.com:8090/";
    var savePath = "./abc.html";
    _dio.download(urlPath, savePath).then((Response response) {
      if (response.statusCode == 200) {
        print(response.data.toString());
      }
    }).catchError((error) {
      print(error.toString());
    });
  }


  ///其余的HEAD、PUT、DELETE请求用法类似，大同小异，大家可以自己试一下
  ///在Widget里请求成功数据后，使用setState来更新内容和状态即可
  ///setState(() {
  ///    ...
  ///  });
}
