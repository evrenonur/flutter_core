


import 'package:flutter_secure_storage/flutter_secure_storage.dart';

mixin StorageManager {




  Future<String?> getData(String key) async {
    const storage = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));
    return await storage.read(key: key);
  }

  Future<void> setData(String key, String value) async {
    const storage = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));
    await storage.write(key: key, value: value);
  }

  Future<void> removeData(String key) async {
    const storage = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));
    await storage.delete(key: key);
  }

  Future<void> clearData() async {
    const storage = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));
    await storage.deleteAll();
  }

  Future<bool> containsKey(String key) async {
    const storage = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));
    return await storage.containsKey(key: key);
  }


}