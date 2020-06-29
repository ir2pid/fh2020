import 'package:Officerr/src/navigator.dart';
import 'package:Officerr/src/pages/new_post/record_video_page.dart';
import 'package:Officerr/src/pages/home/profile_tab/profile_tab.dart';
import 'package:Officerr/src/pages/splash/splash_page.dart';
import 'package:Officerr/src/pages/video_details/video_details_page.dart';
import 'package:Officerr/src/utilui.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../util.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _currentBackPressTime;
  int _currentIndex = 0;
  bool _isTabActive = true;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    init();
    _pageController = PageController(initialPage: _currentIndex);
  }

  init() {}

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: getBody(),
        onWillPop: exitCheck,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: util.getTheme(context).primaryColor,
        child: Icon(Icons.camera, color: util.getTheme(context).accentColor),
        onPressed: () {
          Nav().navigatePush(context, RecordVideoPage.tag, null);
        },
      ),
      bottomNavigationBar: !_isTabActive
          ? null
          : BottomNavyBar(
              backgroundColor: util.getTheme(context).primaryColor,
              selectedIndex: _currentIndex,
              showElevation: true, // use this to remove appBar's elevation
              onItemSelected: (index) {
                setState(() => _currentIndex = index);
                _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
              },
              items: [
                BottomNavyBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Feed'),
                    activeColor: util.getTheme(context).accentColor,
                    inactiveColor: util.getTheme(context).primaryColorDark),
                BottomNavyBarItem(
                    icon: Icon(Icons.camera_alt),
                    title: Text('Create'),
                    activeColor: util.getTheme(context).accentColor,
                    inactiveColor: util.getTheme(context).primaryColorDark),
                BottomNavyBarItem(
                    icon: Icon(Icons.person),
                    title: Text('Profile'),
                    activeColor: util.getTheme(context).accentColor,
                    inactiveColor: util.getTheme(context).primaryColorDark),
              ],
            ),
    );
  }

  void changeTab(int position) {
    return setState(() {
      _currentIndex = position;
      _pageController.animateToPage(position, duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
    });
  }

  getBody() {
    return PageView(
      physics: new NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[VideoDetailsPage(), VideoDetailsPage(), ProfileTab()],
    );
  }

  Future<bool> exitCheck() {
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null || now.difference(_currentBackPressTime) > Duration(seconds: constants.i2)) {
      _currentBackPressTime = now;
      util.toast(
        constants.sExitWarning,
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}
