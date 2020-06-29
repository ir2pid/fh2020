import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

Constants constants = new Constants();

enum Flavor { PRODUCTION, DEBUG, MOCK, RELEASE }
enum FlareAnimationType { CHEER, SUCCESS, FAILURE, INFO, WARNING, ERROR_NETWORK, PEN, PENW }

class DriveFolder {
  static const appDataFolder = 'appDataFolder';
  static const drive = 'drive';
}

class Constants {
  Flavor flavor = Flavor.PRODUCTION;

  get theme => AppTheme.tdDark;

  // strings
  get scAppName => "Officerr";
  get scLoremIpsum => "Lorem ipsum dolor sit amet";
  get scLoremIpsumMed => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
  get scLoremIpsumLarge =>
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  get sExitWarning => "Press back again to exit";
  get sHashtags => "Hashtags #";
  get sTrending => "Trending";

  get sError => "Error";
  get sOauthError => "Oauth error";
  get sOauthAbort => "Oauth aborted";
  get sUnknownErrorCode => "Unknown error code";
  get sUnknownErrorMessage => "Oauth error message";

  get sLogoutSuccess => "Logout Success";

  get sSignInState => "isSignedIn";

  String get sAuthDescription => "Vlog or review your experience with law enforcers around the world";

  String get sAuthDetail => "Add the location, videos, photos and experiences which makes us introspect or inspired";

  String get sLoginGoogle => "Google sign in";

  getUnknownErrorMessage(Exception e) => 'Unknown error: $e';
  getErrorMessage(Exception e) => 'Error: $e';

//resources
  get imgAppLogo => 'assets/icon/app_icon.jpg';
  get animLogo => 'assets/anim/placeholder.json';
  get animAuth1 => 'assets/anim/auth1.json';
  get animAuth2 => 'assets/anim/auth2.json';
  get animAuth3 => 'assets/anim/auth3.json';
  get animAuth4 => 'assets/anim/auth4.json';
  get animAuth5 => 'assets/anim/auth5.json';

  //colors
  get red => Colors.red[300];
  get purple => Colors.purple[300];
  get orange => Colors.orange;
  get grey => Colors.grey;
  get lightGrey => Colors.grey[200];
  get black => Colors.black;
  get black54 => Colors.black54;
  get shadow => Colors.black26;
  get white => Colors.white;
  get green => Colors.green[300];
  get greenAccent => Colors.greenAccent;
  get blue => Colors.blue[200];
  get blueGoogle => Colors.blue;
  get blueGrey => Colors.blueGrey;
  get lime => Colors.lime[300];
  get teal => Colors.teal[300];
  get indigo => Colors.indigo[300];
  get redAccent => Colors.redAccent[100];
  get deepOrange => Colors.deepOrange[300];
  get transparent => Colors.white54;

  get f03 => 0.3;
  get dElevation => 10.0;
  get dRadius => 16.0;
  get dBlur => 7.0;
  get dAnimDuration => Duration(seconds: 2);
  get d190 => 190.0;

  get fHeader24 => 24.0;
  get fHeader16 => 16.0;
  get fHeader12 => 12.0;
  get fHeader10 => 10.0;
  get fWeight3 => FontWeight.w300;
  get fWeight5 => FontWeight.w500;
  get fWeight7 => FontWeight.w700;

  get dMargin10 => EdgeInsets.all(d10);

  get dPadding0 => EdgeInsets.all(d0);
  get dPadding1 => EdgeInsets.all(d1);
  get dPadding4 => EdgeInsets.all(d4);
  get dPadding6 => EdgeInsets.all(d6);
  get dPadding12 => EdgeInsets.all(d12);
  get dPadding16 => EdgeInsets.all(d16);
  get dPadding64 => EdgeInsets.all(d64);

  get i1 => 1;
  get i2 => 2;
  get i16 => 16;
  get i24 => 24;
  get i200 => 200;

  //doubles
  get d0 => 0.0;
  get d04 => 0.4;
  get d1 => 1.0;
  get d4 => 4.0;
  get d2 => 2.0;
  get d5 => 5.0;
  get d6 => 6.0;
  get d8 => 8.0;
  get d10 => 10.0;
  get d12 => 12.0;
  get d16 => 16.0;
  get d20 => 20.0;
  get d24 => 24.0;
  get d32 => 32.0;
  get d36 => 36.0;
  get d48 => 48.0;
  get d52 => 52.0;
  get d50 => 50.0;
  get d64 => 64.0;
  get d72 => 72.0;
  get d86 => 86.0;
  get d100 => 100.0;
  get d150 => 150.0;
  get d200 => 200.0;
  get d250 => 250.0;
  get d300 => 300.0;
  get d600 => 600.0;

  static List<CameraDescription> cameras;
}
