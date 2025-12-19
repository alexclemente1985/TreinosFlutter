import 'dart:io';

import 'package:cbl_flutter/cbl_flutter.dart';
import 'package:checklist/app/services/couchbase_service.dart';
import 'package:checklist/app/utils/couchbase_constants.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

import 'app/app_widget.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == "background-sync") {
      await CouchbaseLiteFlutter.init();
      final service = CouchbaseService();
      //bool result = false;

      bool result = await service.startReplication(
        collectionName: CouchbaseContants.collection,
        continuous: false,
        onSynced: () {
          // result = true;
        },
      );
      if (!result && Platform.isIOS) {
        Workmanager().registerOneOffTask(
          'retry-background-sync-id',
          'background-sync',
          initialDelay: Duration(seconds: 15),
        );
      }

      return Future.value(result);
    } else {
      print("Tarefa desconhecida");
      return true;
    }
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CouchbaseLiteFlutter.init();

  Workmanager().initialize(callbackDispatcher);

  runApp(const MyApp());
}
