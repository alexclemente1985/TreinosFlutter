import 'package:hyrule_app/data/dao/database.dart';
import 'package:hyrule_app/data/dao/entry_dao.dart';
import 'package:hyrule_app/domain/business/dao_workflow.dart';
import 'package:hyrule_app/domain/models/entry.dart';

class DaoController implements DaoWorkflow{
  Future<EntryDao> createDatabase() async{
    final database = await $FloorAppDatabase.databaseBuilder(" app_database.db").build();
    final EntryDao entryDao = database.entryDao;
    return entryDao;
  }
  @override
  Future<void> deleteEntry({required Entry entry}) async {
    final entryDao = await createDatabase();
    entryDao.removeEntry(entry);    
  }

  @override
  Future<List<Entry>> getSavedEntries() async {
    final entryDao = await createDatabase();
    return entryDao.getAllEntries();    
  }

  @override
  Future<void> saveEntry({required Entry entry}) async {
    final entryDao = await createDatabase();
    entryDao.addEntry(entry);   
  }
}