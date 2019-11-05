import 'package:flutter/material.dart';
import 'package:startmyapp/demo/flower.dart';
// import './drawer_demo.dart';
import './drawer.dart';
import './bottom_navigation_bar_demo.dart';
// import './florist_demo.dart';
import './flower.dart';
// import './slider.dart';
import './bike_demo.dart';
// import './jg_push.dart';
// import './gzx_dropdown_menu_test_page.dart';
import './quilt_demo.dart';
import './http.dart';
import './blog1.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("Chensir's Home"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              // onPressed: () => debugPrint('Search button is pressed.'),
              onPressed: () => DartHttpUtils().getParametersDio(),
            )
          ],
          elevation: 0.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.view_quilt)),
              Tab(icon: Icon(Icons.beach_access)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // FloristDemo(),
            FlowerSheet(),
            // FlutterSlidableDemo(),
            BikeSheet(),
            // JpushPage(),
            // GZXDropDownMenuTestPage(),
            QuiltDemo(),
            BlogSheet()
          ],
        ),
        drawer: DrawerState(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}

// void getHttp() async {
//   try {
//     Response response =
//         await Dio().get('http://www.site1.com/wechat/test61.php?name=photo');
//     return print(response);
//   } catch (e) {
//     return print(e);
//   }
// }
