import 'package:flutter/material.dart';
import 'navigation_icon_view.dart';
import '../idea/idea_page.dart';
import '../market/market_page.dart';
import '../my/my_page.dart';
import '../demo/home_page.dart';


class Index extends StatefulWidget {

  @override
  State<Index> createState() => new _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin{

  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: new Icon(Icons.explore),
        title: new Text("Explore"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.history),
        title: new Text("History"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.list),
        title: new Text("List"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.person),
        title: new Text("Person"),
        vsync: this,
      ),
    ];
    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    _pageList = <StatefulWidget>[
      new HomePage(),
      new IdeaPage(),
      new MarketPage(),
      new MyPage()
    ];
    _currentPage = _pageList[_currentIndex];
  }

  void _rebuild() {
    setState((){});
  }

  @override
  void dispose() {
    super.dispose();
    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        items: _navigationViews
            .map((NavigationIconView navigationIconView) => navigationIconView.item)
            .toList(),
      currentIndex: _currentIndex,
      fixedColor: Colors.purple,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState((){
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
          _currentPage = _pageList[_currentIndex];
        });
      }
    );

    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
            child: _currentPage

        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
      theme: ThemeData(primaryColor: Colors.purple),
      debugShowCheckedModeBanner: false,
    );
  }

}