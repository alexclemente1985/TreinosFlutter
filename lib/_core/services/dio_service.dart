import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:listins/_core/data/local_data_handler.dart';
import 'package:listins/listins/data/database.dart';

class DioService {
  final Dio _dio = Dio();

  static const String url = "https://flutter-dio-ff81a-default-rtdb.firebaseio.com/";

  Future<void> saveLocalToServer(AppDataBase appDataBase) async{
    Map<String, dynamic> localData =  await LocalDataHandler().localDataToMap(appdatabase: appDataBase);

    //especificidade do Firebase Realtime -> <nome>.json
    await _dio.put( //no caso do Realtime, o put é uma melhor escolha por conta do ID (não queremos um ID aleatório do Firebase, mas o ID "listins")
      url+"listins.json",
       data: json.encode(localData["listins"]),
       options: Options(
        contentType: "application/json; utf-8",
       )
    ); 
  }

  getDataFromServer(AppDataBase appDataBase) async {
    Response response = await _dio.get("${url}listins.json");

    // print(response.statusCode);
    // print(response.headers.toString());
    // print(response.data);
    // print(response.data.runtimeType);

    if(response.data != null){
      if((response.data as List<dynamic>).isNotEmpty){
        Map<String,dynamic> map = {};

        map['listins'] = response.data;

        await LocalDataHandler().mapToLocalData(map: map, appdatabase: appDataBase);

      }
    }
  }
}