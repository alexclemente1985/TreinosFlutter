import 'package:dio/dio.dart';
import 'package:hyrule_app/domain/models/entry.dart';
import 'package:hyrule_app/utils/consts/api.dart';

class DataApi {
  final Dio dio = Dio();
  List<Entry> entries = [];

  Future<List<Entry>> getEntriesByCategory({required String category}) async {
    final response = await dio.get(url + category);

    entries = List<Entry>.from(response.data['data'].map((e)=> Entry.fromMap(e)));
    return entries;
  }
}