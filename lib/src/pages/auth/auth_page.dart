import 'package:Officerr/src/pages/home/home_page.dart';
import 'package:Officerr/src/pages/video_details/video_details_page.dart';
import 'package:Officerr/src/providers/auth_provider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../util.dart';
import '../../utilui.dart';

class AuthPage extends StatefulWidget {
  static String tag = 'auth-page';

  @override
  State<StatefulWidget> createState() {
    return _AuthPage();
  }
}

class _AuthPage extends State<StatefulWidget> {
  int _current = 0;

  final List<Widget> animList = [
    UtilUI.getLottie(constants.animAuth1),
    UtilUI.getLottie(constants.animAuth2),
    UtilUI.getLottie(constants.animAuth3),
    UtilUI.getLottie(constants.animAuth4),
    UtilUI.getLottie(constants.animAuth5)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: UtilUI.getTextH1(constants.scAppName, constants, util.getTheme(context).accentColor)),
        body: WillPopScope(
          onWillPop: exitCheck,
          child: Container(
            padding: constants.dPadding6,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              UtilUI.getText(constants.sAuthDescription, constants.fHeader24, util.getTheme(context).accentColor, maxLines: 3),
              SizedBox(height: constants.d24),
              UtilUI.getTextDescription(constants.sAuthDetail, constants),
              CarouselSlider(
                items: animList,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: animList.map((url) {
                  int index = animList.indexOf(url);
                  return Container(
                    width: constants.d8,
                    height: constants.d8,
                    margin: EdgeInsets.symmetric(vertical: constants.d10, horizontal: constants.d2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index ? constants.blue : constants.grey,
                    ),
                  );
                }).toList(),
              ),
              Container(
                  padding: constants.dPadding64,
                  child: UtilUI.getButton(context, constants, constants.sLoginGoogle, () {
                    AuthProvider().login(context, () async {
                      util.log("going to home");
                      util.navigatePushReplacement(context, HomePage.tag, {});
                    });
                  }, color: constants.blue))
            ]),
          ),
        ));
  }

  Future<bool> exitCheck() {
    return Future.value(true);
  }
}
