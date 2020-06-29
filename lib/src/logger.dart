import 'package:logger/logger.dart';

enum LogLevel { VERBOSE, INFO, ERROR, DEBUG, WARNING, WTF }

class Log {
  Logger logger;

  Log() {
    logger = Logger(printer: PrettyPrinter(colors: true, errorMethodCount: 1, printEmojis: true, printTime: true, lineLength: 80, methodCount: 0));
  }

  log(message, {logLevel = LogLevel.DEBUG}) {
    var msg = message.runtimeType == String ? message : "${message.toString()}";
    switch (logLevel) {
      case LogLevel.DEBUG:
        logger.d(msg);
        break;
      case LogLevel.INFO:
        logger.i(msg);
        break;
      case LogLevel.ERROR:
        logger.e(msg);
        break;
      case LogLevel.WARNING:
        logger.w(msg);
        break;
      case LogLevel.WTF:
        logger.wtf(msg);
        break;
      default:
        logger.e(msg);
    }
  }

  void logError(error) {
    log("error :${error.toString()}");
  }
}
