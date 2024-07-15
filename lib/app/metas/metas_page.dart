
import 'package:flutter/material.dart';
import 'package:metinhas/app/notifiers/tarefa_notifier.dart';

import 'metas_model.dart';

class MetasPage extends StatelessWidget {
  final MetasNotifier metasNotifier = MetasNotifier();

  MetasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metinhas'),
      ),
      body: ValueListenableBuilder<List<Meta>>(
        valueListenable: metasNotifier,
        builder: (context, metas, _) {
          if (metas.isEmpty){
            return const Center(
              child: Text('Nenhuma meta encontrada'),
            );
          }
          return ListView.builder(
            itemCount: metas.length,
            itemBuilder: (context, index) {
              final metasListadas = metas[index];
              return ListTile(
                title: Text(
                  metasListadas.descricao,
                  style: TextStyle(decoration: metasListadas.isCompleta ? TextDecoration.lineThrough : TextDecoration.none),
                ),
                trailing: Checkbox(
                  value: metasListadas.isCompleta,
                  onChanged: (value) {
                    metasNotifier.atualizarMeta(index);
                  },
                ),
                onLongPress: () {
                  metasNotifier.excluirMeta(index);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              TextEditingController metaController = TextEditingController();
              return AlertDialog(
                title: const Text('Adicionar meta'),
                content: TextField(
                  controller: metaController,
                  decoration: const InputDecoration(hintText: 'Digite a meta'),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      metasNotifier.addMeta(metaController.text);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Adicionar meta'),
                  )
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
