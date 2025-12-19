// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmanager/workmanager.dart';

import '../entities/shopping_item_entity.dart';
import '../helpers/dialogs.dart';
import '../logic/add_checklist_item/add_checklist_cubit.dart';
import '../logic/checklist/checklist_cubit.dart';
import '../logic/checklist/checklist_state.dart';
import '../logic/delete_checklist_item/delete_checklist_cubit.dart';
import '../logic/update_checklist_item/update_checklist_cubit.dart';
import '../services/couchbase_service.dart';
import '../utils/couchbase_constants.dart';
import '../widget/input_widget.dart';
import '../widget/list_section_widget.dart';

class ChecklistPage extends StatefulWidget {
  const ChecklistPage({super.key});

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  final textController = TextEditingController();

  // ON/OFF CHECK ITEM
  Future<void> toggleItemCompletion(ShoppingItemEntity item) async {
    await context.read<UpdateChecklistCubit>().updateItem(
      item.id!,
      isCompleted: !item.isCompleted,
    );
    context.read<FetchChecklistCubit>().fetchItems();
  }

  // DELETE ITEM
  void deleteItem(ShoppingItemEntity item) {
    Dialogs.showConfirmationDialog(
      context: context,
      title: 'Confirmação',
      content: 'Deseja excluir o item "${item.title}"?',
      onConfirm: () async {
        await context.read<DeleteChecklistCubit>().deleteItem(item.id!);
        context.read<FetchChecklistCubit>().fetchItems();
      },
    );
  }

  // UPDATE ITEM
  void editItem(ShoppingItemEntity item) {
    TextEditingController controller = TextEditingController(text: item.title);

    Dialogs.showEditDialog(
      context: context,
      title: 'Editar Item',
      controller: controller,
      onConfirm: () async {
        await context.read<UpdateChecklistCubit>().updateItem(
          item.id!,
          title: controller.text,
        );
        context.read<FetchChecklistCubit>().fetchItems();
      },
    );
  }

  // ADD ITEM
  Future<void> addItem() async {
    await context.read<AddChecklistCubit>().addItem(
      ShoppingItemEntity(
        title: textController.text,
        createdAt: DateTime.now(),
        isCompleted: false,
      ),
    );
    textController.clear();
    context.read<FetchChecklistCubit>().fetchItems();
  }

  Future<void> initApp() async {
    await context.read<FetchChecklistCubit>().fetchItems();
    context.read<CouchbaseService>().startReplication(
      collectionName: CouchbaseContants.collection,
      onSynced: () {
        context.read<FetchChecklistCubit>().fetchItems();
      },
    );
    context.read<CouchbaseService>().networkStatusListen();
  }

  @override
  void initState() {
    super.initState();
    initApp();
  }

  @override
  void dispose() {
    context.read<CouchbaseService>().networkConnection?.cancel();
    context.read<CouchbaseService>().replicator?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Workmanager().registerPeriodicTask(
            'background-sync-id',
            'background-sync',
            frequency: Duration(minutes: 15), //mínimo de 15 min para usar no Android
            //inputData: {}
            constraints: Constraints(
              networkType: NetworkType.connected, //limita a execução somente em casos de conexão com a internet
              //requiresCharging: true //aplicativo carregando
              //requiresBatteryNotLow: true //bateria com pelo menos 20%
              //requiresStorageNotLow: true, //armazenamento suficiente
              //requiresDeviceIdle: true //garantia de que o dispositivo esteja bem sincronizado (pouco usado)
            ),
            //backoffPolicy: BackoffPolicy.exponential //default -> pega o tempo definido e aumenta de forma exponencial até obter sucesso (ideal para situações de grande consumo de recursos)
            backoffPolicy: BackoffPolicy.linear, //aumenta o tempo de tentativas de maneira linear (melhor para situações mais simples)
            backoffPolicyDelay: Duration(seconds: 15)
          );
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff020307), Color(0xff232F76)],
          ),
        ),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 56),
              child: Column(
                children: [
                  InputWidget(controller: textController, onAddItem: addItem),
                  const SizedBox(height: 48),
                  BlocBuilder<FetchChecklistCubit, FetchChecklistState>(
                    builder: (context, state) {
                      if (state is FetchChecklistLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is FetchChecklistLoaded) {
                        final items = state.items;

                        final notCompletedItems = items
                            .where((item) => !item.isCompleted)
                            .toList();

                        final completedItems = items
                            .where((item) => item.isCompleted)
                            .toList();

                        return Column(
                          children: [
                            ListSectionWidget(
                              title: 'Lista de Compras',
                              items: notCompletedItems,
                              onToggleCompletion: (index) =>
                                  toggleItemCompletion(
                                    notCompletedItems[index],
                                  ),
                              onDeleteItem: (index) =>
                                  deleteItem(notCompletedItems[index]),
                              onEditItem: (index) =>
                                  editItem(notCompletedItems[index]),
                            ),
                            ListSectionWidget(
                              title: 'Comprado',
                              items: completedItems,
                              onToggleCompletion: (index) =>
                                  toggleItemCompletion(completedItems[index]),
                              onDeleteItem: (index) =>
                                  deleteItem(completedItems[index]),
                              onEditItem: (index) =>
                                  editItem(completedItems[index]),
                            ),
                          ],
                        );
                      } else if (state is FetchChecklistError) {
                        return Center(child: Text(state.message));
                      } else {
                        return const Center(
                          child: Text('Nenhum item disponível.'),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            const Center(
              child: Text(
                'Desenvolvido por Alura. Projeto fictício sem fins comerciais.',
                style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
