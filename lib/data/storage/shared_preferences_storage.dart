import 'dart:developer';

import 'package:runner_circle/data/storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage implements LocalStorage{
  Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }
  @override
  Future<bool> create<T>({required String key, required T data}) async {
    final i = await getInstance();
    if(data is String){
      i.setString(key, data);
    } else if (data is double){
      i.setDouble(key, data);
    } else if (data is bool){
      i.setBool(key, data);
    } else if (data is List<String>){
      i.setStringList(key, data);

    }else {
      log('Tipo não suportado');
      return false;
    }
    return true;
  }

  @override
  Future<bool> delete({required String key}) async {
    final i = await getInstance();
    return await i.remove(key);
  }

  @override
  Future<T> getData<T>({required String key}) async {
    final i = await getInstance();
    return i.get(key) as T;
  }
}