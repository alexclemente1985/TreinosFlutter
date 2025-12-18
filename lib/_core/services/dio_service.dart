import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:listins/_core/data/local_data_handler.dart';
import 'package:listins/_core/services/dio_endpoints.dart';
import 'package:listins/_core/services/dio_interceptor.dart';
import 'package:listins/_core/services/loading_service.dart';
import 'package:listins/listins/data/database.dart';

class DioService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: DioEndpoints.devBaseUrl,
      // contentType: "application/json; utf-8",
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      connectTimeout: Duration(seconds: 5), //tempo para acessar o servidor
      receiveTimeout: Duration(seconds: 3) //tempo para o servidor responder
    )
  );

  DioService(){
    // _dio.interceptors.add(LogInterceptor());
    _dio.interceptors.add(DioInterceptor());
  }

  // static const String url = "https://flutter-dio-ff81a-default-rtdb.firebaseio.com/";

  LoadingService loadingService = LoadingService();


  Future<bool> saveLocalToServer(AppDataBase appDataBase) async{
    try{
      loadingService.setLoading(true);
      Map<String, dynamic> localData =  await LocalDataHandler().localDataToMap(appdatabase: appDataBase);

      //especificidade do Firebase Realtime -> <nome>.json
      await _dio.put( //no caso do Realtime, o put é uma melhor escolha por conta do ID (não queremos um ID aleatório do Firebase, mas o ID "listins")
        // url+DioEndpoints.listins,
        DioEndpoints.listins,
          data: json.encode(localData["listins"]),
          // options: Options(
          //   contentType: "application/json; utf-8",
          // )
      ); 

      return true;
    }
    on DioException catch (e){
      throw "Erro DIO EXCEPTION: ${e.message}";
    }
    catch (e){
      throw "Erro na operação de salvamento local: ${e}";
    }
    finally{
      loadingService.setLoading(false);
    }
  }

  Future<bool> getDataFromServer(AppDataBase appDataBase) async {
    try{
      loadingService.setLoading(true);

      // Response response = await _dio.get("${url}listins.json");
      Response response = await _dio.get(
        DioEndpoints.listins,
        queryParameters: {
          "orderBy": '"name"',
          "startAt": 0
        });

    // print(response.statusCode);
    // print(response.headers.toString());
    // print(response.data);
    // print(response.data.runtimeType);

      if(response.data != null){
        Map<String,dynamic> map = {};
        if(response.data.runtimeType == List){
          if((response.data as List<dynamic>).isNotEmpty){           

            map['listins'] = response.data;
            
          }
        }else{
          List<Map<String,dynamic>> tempList = [];

          for(var mapResponse in (response.data as Map).values){
            tempList.add(mapResponse);
          }

          map["listins"] = tempList;
        }

        await LocalDataHandler().mapToLocalData(map: map, appdatabase: appDataBase);
        return true;

        
      }
      return false;
    }
    catch (e){
      throw "Falha na sincronização dos dados: $e";
    }
    finally{
      loadingService.setLoading(false);
    }
  }

  Future<bool> clearServerData() async{
    try{
      loadingService.setLoading(true);
      // Response response = await _dio.delete("${url}listins.json");
      Response response = await _dio.delete(DioEndpoints.listins);
      if(response.statusCode == 200){
        return true;
      }

      return false;
    }
    catch (e){
      throw "Erro na operação de remoção de dados no servidor: $e";
    }
    finally{
      loadingService.setLoading(false);
    }
  }
}