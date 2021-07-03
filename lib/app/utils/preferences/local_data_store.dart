import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalDataStore {
  static setData({required String key, required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(key, value);
  }

  static removeData({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static deleteAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<String?> getValue({required String key}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    } on Exception catch (_) {
      return null;
    }
  }

  static setListData({required String key, required List<Map> value}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.setStringList(
          key, value.map<String>((e) => jsonEncode(e)).toList());
    } on Exception catch (_) {
      return null;
    }
  }

  static Future<List<T>> getList<T>(
      {required String key, required T Function(Map) fromMap}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final listString = prefs.getStringList(key);
      List<T> tempList =
          listString?.map<T>((e) => fromMap(jsonDecode(e))).toList() ?? <T>[];

      return tempList;
    } on Exception catch (_) {
      return <T>[];
    }
  }
}
