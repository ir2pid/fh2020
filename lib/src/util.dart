import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'constants.dart';
import 'logger.dart';
import 'navigator.dart';

Util util = new Util();

class Util {
  final logger = Log();
  final nav = Nav();

  Future<String> loadAssetString(String filePath) async {
    return await rootBundle.loadString(filePath);
  }

  void toast(String text, {position = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: position,
        timeInSecForIos: constants.i1,
        backgroundColor: constants.grey,
        textColor: constants.white,
        fontSize: constants.fHeader16);
  }

  showAlert(BuildContext context, Widget header, Widget list, {bool isScale = false}) {
    var dialog = AlertDialog(
      elevation: constants.dElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(constants.dRadius),
      ),
      title: header,
      content: list,
    );
    _getDialogAnimation(context, _getBlurDialogBackground(dialog), isScale: isScale);
  }

  BlurDialogBackground _getBlurDialogBackground(Widget child) {
    return BlurDialogBackground(
      blur: constants.dBlur,
      dialog: child,
    );
  }

  Future _getDialogAnimation(BuildContext context, Widget child, {bool isScale = true}) {
    return showGeneralDialog(
        transitionBuilder: (context, a1, a2, widget) {
          return isScale ? getAnimScale(a1, child) : getAnimTransition(a1, child);
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }

  getAnimScale(Animation<double> a1, Widget child) {
    return Transform.scale(
      scale: a1.value,
      child: Opacity(
        opacity: a1.value,
        child: child,
      ),
    );
  }

  getAnimTransition(Animation<double> a1, Widget child) {
    final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
    return Transform(
      transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
      child: Opacity(opacity: a1.value, child: child),
    );
  }

  ThemeData getTheme(BuildContext context) {
    return Theme.of(context);
  }

  log(String message) {
    if (constants.flavor != Flavor.RELEASE) {
      logger.log(message);
    }
  }

  void logError(error) {
    logger.logError("error :${error.toString()}");
  }

  getSvg(String code) {
    SvgPicture.string(code, width: constants.d24);
  }

  getTime() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  navigatePush(BuildContext context, String name, Object args) {
    util.log("navigatePush $name");
    return nav.navigatePush(context, name, args);
  }

  navigatePushReplacement(BuildContext context, String name, Object args) {
    util.log("navigatePushReplacement $name");
    return nav.navigatePushReplacement(context, name, args);
  }

  navigatePop(BuildContext context, Object obj) {
    util.log("navigate pop");
    nav.navigatePop(context, obj);
  }

  jsonMapToString(Map<String, dynamic> map) {
    return jsonEncode(map);
  }

  stringtoJsonMap(String jsonString) {
    return jsonDecode(jsonString);
  }
}
