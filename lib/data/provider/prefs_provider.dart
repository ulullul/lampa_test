import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsProvider {
/*  final SharedPreferences _instance;

  const PrefsProvider(this._instance);*/

  Future<void> write(String key, Object value) async {
    final instance = await SharedPreferences.getInstance();

    await instance.setString(key, jsonEncode(value));
  }

  Future<void> writeList(String key, List<Object> value) async {
    final instance = await SharedPreferences.getInstance();

    await instance.setStringList(
      key,
      value.map((e) => jsonEncode(e)).toList(),
    );
  }

  Future<void> remove(String key) async {
    final instance = await SharedPreferences.getInstance();

    instance.remove(key);
  }

  Future<dynamic> get(String key) async {
    final instance = await SharedPreferences.getInstance();

    final val = instance.getString(key);

    if (val == null) return null;

    return jsonDecode(val);
  }

  Future<List?> getList(String key) async {
    final instance = await SharedPreferences.getInstance();

    final val = instance.getStringList(key);

    if (val == null) return null;

    return val.map((e) => jsonDecode(e)).toList();
  }
}
