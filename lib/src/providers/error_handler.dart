import 'package:Officerr/src/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

enum ErrorType { DEBUG, INFO, WARNING, ERROR }

class AppException implements Exception {
  String message;
  int code;
  AppException({this.code, this.message});
}

class ErrorHandler {
  BuildContext context;
  dynamic error;
  ErrorType type;

  ErrorHandler(this.context, this.error, {this.type = ErrorType.WARNING}) {
    _handleError();
  }

  _handleError() {
    util.log("_handleError ${error}");
    if (error == null) {
      _showError(AppException(code: int.parse(constants.sUnknownErrorCode), message: constants.sError));
    }

    switch (error.runtimeType) {
      case PlatformException:
        var exception = AppException(code: int.parse((error as PlatformException).code), message: (error as PlatformException).message);
        _showError(exception);
        break;
      case String:
        var exception = AppException(code: int.parse(constants.sUnknownErrorCode), message: error);
        _showError(exception);
        break;
      case AppException:
        _showError(error);
        break;
      default:
        var exception = AppException(code: int.parse(constants.sUnknownErrorCode), message: constants.sUnknownErrorMessage);
        _showError(exception);
    }
  }

  _showError(AppException appException) {
    util.log("_showError $type _code ${appException.code} _message ${appException.message}");
    switch (type) {
      case ErrorType.ERROR:
        util.toast(appException.message);
        break;
      case ErrorType.WARNING:
        util.toast(appException.message);
        util.logError(appException.message);
        break;
      case ErrorType.DEBUG:
      case ErrorType.INFO:
      default:
        util.logError(appException.message);
        break;
    }
  }
}
