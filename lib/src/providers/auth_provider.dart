import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../util.dart';
import 'error_handler.dart';
import 'storage.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  StreamSubscription<GoogleSignInAccount> subscription;
  GoogleSignInAccount googleSignInAccount;
  Function _callback;
  FirebaseUser _firebaseUser;
  var signedIn = false;

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
    hostedDomain: "",
    clientId: "",
  );

  AuthProvider() {
    if (subscription == null) {
      util.log("subscribed to signin listner");
      subscription = googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount _googleSignInAccount) async {
        googleSignInAccount = _googleSignInAccount;
        if (googleSignInAccount != null) {
          util.log("new signin complete");
          if (_callback != null) _callback();
          _callback = null;
        }
      });
    }
  }

  bool get isAuth {
    _firebaseUser.getIdToken().then((token) {
      return token.expirationTime.isAfter(
        DateTime.now(),
      );
    });
  }

  void login(BuildContext context, Function callback) async {
    util.log("loginWithGoogle");
    try {
      _callback = callback;
      signedIn = await storage.getSecure(constants.sSignInState) == "true" ? true : false;

      if (signedIn) {
        util.log("already signed in");
        storage.setSecure(constants.sSignInState, "false").then((value) {
          util.log("silent signin failed");
          signedIn = false;
        });
        try {
          googleSignIn
              .signInSilently()
              .whenComplete(() => () {
                    util.log("silent signin");
                  })
              .catchError((onError) {
            ErrorHandler(context, onError);
          });
        } catch (e) {
          storage.setSecure(constants.sSignInState, "false").then((value) {
            util.log("silent signin failed");
            signedIn = false;
          });
        }
      } else {
        try {
          util.log("sign out");
          await googleSignIn.signOut();
          //await googleSignIn.disconnect();
        } catch (exception) {
          ErrorHandler(context, exception);
        }
        util.log("begin signin");
        await googleSignIn.signIn();
        //_afterGoogleLogin(context, _googleSignInAccount);
      }
    } catch (exception) {
      ErrorHandler(context, exception);
    }
  }

  Future<void> _afterGoogleLogin() async {
    util.log("_afterGoogleLogin");

    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    _firebaseUser = await _auth.currentUser();
    assert(user.uid == _firebaseUser.uid);
  }

  void logoutFromGoogle(BuildContext context) async {
    util.log("logoutFromGoogle");
    await googleSignIn.disconnect();
    //await _auth.signOut();
    googleSignIn.signOut().then((value) async {
      ErrorHandler(context, constants.sLogoutSuccess, type: ErrorType.WARNING);
      util.log("User Sign Out");
      print(value);
      await googleSignIn.disconnect();
      storage.setSecure(constants.sSignInState, "false").then((value) {
        signedIn = false;
      });
    });
  }
}
