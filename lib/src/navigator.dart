import 'package:flutter/material.dart';

import 'util.dart';

class Nav {
  navigatePush(BuildContext context, String name, Object args) {
    util.log("navigatePush $name");
    return Navigator.pushNamed(context, name, arguments: args);
  }

  navigatePushReplacement(BuildContext context, String name, Object args) {
    util.log("navigatePushReplacement $name");
    return Navigator.pushReplacementNamed(context, name, arguments: args);
  }

  navigatePop(BuildContext context, Object obj) {
    Navigator.pop(context, obj);
  }
}
