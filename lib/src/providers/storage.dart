import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../util.dart';

final storage = Storage();

class Storage {
  final _secure = FlutterSecureStorage();

  // secure

  Future<String> getSecure(String key) async {
    var value = await _secure.read(key: key);
    util.log("reading secure $key - $value");
    return value;
  }

  setSecure(String key, String value, {IOSOptions iosOptions, AndroidOptions androidOptions}) async {
    util.log("writing secure $key - $value");
    return await _secure.write(key: key, value: value, iOptions: iosOptions, aOptions: androidOptions);
  }

  Future<Map<String, String>> getSecureAll() async {
    return await _secure.readAll();
  }

  getSecureDeleteAll(String key) async {
    await _secure.deleteAll();
  }

  deleteSecure(String key) async {
    await _secure.delete(key: key);
  }
}
