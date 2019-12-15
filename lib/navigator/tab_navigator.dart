import 'package:flutter/material.dart';
import 'package:flutter_phone/pages/class_page.dart';
import 'package:flutter_phone/pages/home_page.dart';
import 'package:flutter_phone/pages/my_page.dart';
import 'package:flutter_phone/pages/school_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigator createState() => _TabNavigator();
}

class _TabNavigator extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: _controller,
          children: <Widget>[
            HomePage(),
            ClassPage(),
            SchoolPage(),
            MyPage()
          ],
          physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex:_currentIndex,
          onTap:(index){
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomItem("首页",Icons.home,0),
            _bottomItem("班级",Icons.class_,1),
            _bottomItem("学校",Icons.school,2),
            _bottomItem("我的",Icons.account_circle,3)
      ]),
    );
  }

  _bottomItem(String title, IconData icon, int index){
    return BottomNavigationBarItem(
        icon: Icon(
            icon,
            color: _defaultColor
        ),
        activeIcon: Icon(
            icon,
            color: _activeColor
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : _activeColor),
        ));
  }
}

