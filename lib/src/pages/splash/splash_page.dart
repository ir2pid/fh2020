import 'dart:async';

import 'package:Officerr/src/pages/auth/auth_page.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../util.dart';
import '../../utilui.dart';

class SplashPage extends StatefulWidget {
  static String tag = 'splash-page';

  @override
  State<StatefulWidget> createState() {
    return _SplashPage();
  }
}

class _SplashPage extends State<StatefulWidget> {
  Timer _timer;
  int _start = 1;
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: UtilUI.getTextH1(constants.scAppName, constants, util.getTheme(context).accentColor)),
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          UtilUI.getTextH1(constants.scAppName, constants, util.getTheme(context).accentColor),
          SizedBox(height: constants.d24),
          //UtilUI.getTextDescription(constants.scLoremIpsumMed, constants),
          UtilUI.getLottie(constants.animLogo),
        ]),
      ),
    );
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            util.navigatePushReplacement(context, AuthPage.tag, {});
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }
}
