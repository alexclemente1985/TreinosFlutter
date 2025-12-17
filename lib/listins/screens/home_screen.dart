import 'package:flutter/material.dart';
import 'package:listins/_core/helpers/confirmation_dialog.dart';
import 'package:listins/_core/services/dio_service.dart';
import 'package:listins/authentication/models/mock_user.dart';
import 'package:listins/listins/data/database.dart';
import 'package:listins/listins/screens/widgets/home_drawer.dart';
import 'package:listins/listins/screens/widgets/home_listin_item.dart';
import '../models/listin.dart';
import 'widgets/listin_add_edit_modal.dart';
import 'widgets/listin_options_modal.dart';

class HomeScreen extends StatefulWidget {
  final MockUser user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Listin> listListins = [];
  late AppDataBase _appDataBase;

  DioService _dioService = DioService();

  @override
  void initState() {
    _appDataBase = AppDataBase();
    refresh();
    super.initState();
  }

  @override
  void dispose() {
    _appDataBase.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(user: widget.user),
      appBar: AppBar(
        title: const Text("Minhas listas"),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.cloud),
            onSelected: (value) {
              if(value == "SAVE"){ saveOnServerAction(context); }
              if(value == "SYNC"){ syncWithServerAction(context); }
              if(value == "CLEAR"){ clearServerDataAction(context); }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: "SAVE",
                  child: ListTile(leading: Icon(Icons.upload), title: Text("Salvar na nuvem"),)
                ),
                PopupMenuItem(
                  value: "SYNC",
                  child: ListTile(leading: Icon(Icons.download), title: Text("Sincronizar da nuvem"),)
                ),
                PopupMenuItem(
                  value: "CLEAR",
                  child: ListTile(leading: Icon(Icons.clear), title: Text("Remover dados da nuvem"),)
                ),
              ];
            })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddModal();
        },
        child: const Icon(Icons.add),
      ),
      body: (listListins.isEmpty)
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/bag.png"),
                  const SizedBox(height: 32),
                  const Text(
                    "Nenhuma lista ainda.\nVamos criar a primeira?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () {
                return refresh();
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                child: ListView(
                  children: List.generate(
                    listListins.length,
                    (index) {
                      Listin listin = listListins[index];
                      return HomeListinItem(
                        listin: listin,
                        showOptionModal: showOptionModal,
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }

  showAddModal({Listin? listin}) {
    showAddEditListinModal(context: context, onRefresh: refresh, model: listin, appDataBase: _appDataBase);
  }

  showOptionModal(Listin listin) {
    showListinOptionsModal(
      context: context,
      listin: listin,
      onRemove: remove,
    ).then((value) {
      if (value != null && value) {
        showAddModal(listin: listin);
      }
    });
  }

  refresh() async {
    // Basta alimentar essa variável com Listins que, quando o método for
    // chamado, a tela sera reconstruída com os itens.
    List<Listin> listaListins = await _appDataBase.getListins();

    

    setState(() {
      listListins = listaListins;
    });
  }

  void remove(Listin model) async {
    await _appDataBase.deleteListin(int.parse(model.id));
    refresh();
  }

  saveOnServerAction(BuildContext context){
    showConfirmationDialog(context, "Confirma a sobrescrita dos dados na nuvem?", saveOnServer);
    // serverOperationsAlert(saveOnServer, "Confirma a sobrescrita dos dados na nuvem?", context);
  }
  syncWithServerAction(BuildContext context){
    showConfirmationDialog(context, "Confirma a sobrescrita dos dados locais?", syncWithServer);
    // serverOperationsAlert(syncWithServer, "Confirma a sobrescrita dos dados locais?", context);
  }
  clearServerDataAction(BuildContext context){
    showConfirmationDialog(context, "Confirma a remoção dos dados na nuvem?", clearServerData);
    // serverOperationsAlert(clearServerData, "Confirma a remoção dos dados na nuvem?", context);
  }

  saveOnServer() async{
   await _dioService.saveLocalToServer(_appDataBase);
  //  return print("Realizando operação de sobrescrita de dados no servidor...");
  }
  syncWithServer() async {
    await _dioService.getDataFromServer(_appDataBase);
    refresh();
    // return print("Realizando operação de sobrescrita de dados locais...");
  }
  clearServerData(){
    return print("Realizando operação de remoção de dados no servidor...");
  }

  serverOperationsAlert(Function operation, String text, BuildContext context){
    return showDialog(
      context: context, 
      builder: (context){
      return AlertDialog(
        title: Text("Atenção"),
        content: Text(text),
        actions: [
          ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            child: Text("Cancelar")
          ),
          ElevatedButton(
            onPressed: (){
              operation();
              Navigator.pop(context);
            }, 
            child: Text("Confirmar")
          ),
        
        ],
        );
    });
  }
}
