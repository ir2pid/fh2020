import 'package:Officerr/src/pages/auth/auth_page.dart';
import 'package:Officerr/src/pages/home/home_page.dart';
import 'package:Officerr/src/pages/new_post/record_video_page.dart';
import 'package:Officerr/src/pages/splash/splash_page.dart';
import 'package:camera/camera.dart';
import 'package:Officerr/src/pages/video_details/single_video_page.dart';
import 'package:Officerr/src/providers/post_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import 'src/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Constants.cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    SplashPage.tag: (context) {
      return SplashPage();
    },
    AuthPage.tag: (context) {
      return AuthPage();
    },
    HomePage.tag: (context) {
      return HomePage();
    },
    RecordVideoPage.tag: (context) {
      return RecordVideoPage();
    },
    SingleVideoPage.tag: (context) {
      return SingleVideoPage();
    }
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (buildContext) => PostProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: constants.scAppName,
        theme: constants.theme,
        home: SplashPage(),
        routes: routes,
      ),
    );
  }
}
