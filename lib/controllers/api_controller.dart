import 'package:hyrule_app/data/api/data_api.dart';
import 'package:hyrule_app/domain/business/api_workflow.dart';
import 'package:hyrule_app/domain/models/entry.dart';

class ApiController implements ApiWorkflow{
  final DataApi dataApi = DataApi();

  @override
  Future<List<Entry>> getEntriesByCategory({required String category}) async {
    return dataApi.getEntriesByCategory(category: category);
  }
}