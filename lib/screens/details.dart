import 'package:flutter/material.dart';
import 'package:hyrule_app/controllers/dao_controller.dart';
import 'package:hyrule_app/domain/models/entry.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.entry});

  final Entry entry;
  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          daoController.saveEntry(entry: entry);
        },
      ),
      body: Column(
        children: [
          Text(entry.name),
          Wrap(
            children: entry.commonLocationsConverter().map(
              (e)=> Chip(label: Text(entry.name))
            ).toList(),
          ),
          Image.network(entry.image),
          Text(entry.description)
        ],
      ),
    ));
  }
}