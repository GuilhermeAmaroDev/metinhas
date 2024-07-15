import 'package:flutter/material.dart';
import 'package:metinhas/app/notifiers/tarefa_notifier.dart';
import 'add_metas_dialog.dart';
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
          if (metas.isEmpty) {
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
                  style: TextStyle(
                    decoration: metasListadas.isCompleta
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
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
              return AddMetaDialog(metasNotifier: metasNotifier);
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}