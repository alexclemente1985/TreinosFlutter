import 'package:flutter/material.dart';
import 'package:hyrule_app/controllers/dao_controller.dart';
import 'package:hyrule_app/domain/models/entry.dart';
import 'package:hyrule_app/screens/details.dart';

class EntryCard extends StatelessWidget {
  EntryCard({super.key, required this.entry, required this.isSaved});
  final Entry entry;
  final bool isSaved;
  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        key: ValueKey(entry.id), 
        direction: isSaved ? DismissDirection.endToStart : DismissDirection.none,
        onDismissed: (direction){
          daoController.deleteEntry(entry: entry);
        },
        child: Column(
        children: [
          InkWell(
            onTap:() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Details(entry: entry)));
            },
            child: Row(
              children: [
                Image.network(entry.image),
                Column(
                  children: [
                    Text(entry.name),
                    Text(entry.description)
                  ],
                )
              ],
            ),
          ),
          Wrap(
            children: entry.commonLocationsConverter().map(
                (e)=> Chip(
                  label: Text(e),
                )
              ).toList(),
          )
        ],
      ),
      )
    );
  }
}