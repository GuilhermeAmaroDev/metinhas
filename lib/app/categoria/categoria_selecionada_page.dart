import 'package:flutter/material.dart';
import 'package:metinhas/app/metas/meta_view_model.dart';
import 'categoria_model.dart';
import 'categoria_view_model.dart';


class MetaSelecionadaPage extends StatelessWidget {
  final String categoriaNome;
  final CategoriaViewModel categoriaViewModel;
  final MetaViewModel metaViewModel;

  const MetaSelecionadaPage({
    required this.categoriaNome,
    required this.categoriaViewModel,
    required this.metaViewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metas $categoriaNome'),
      ),
      body: ValueListenableBuilder<List<CategoriaMeta>>(
        valueListenable: categoriaViewModel.notifier,
        builder: (context, categorias, _) {
          final categoria = categorias.firstWhere((cat) => cat.nome == categoriaNome);
          if (categoria.metas.isEmpty) {
            return const Center(
              child: Text('Nenhuma meta encontrada'),
            );
          }

          return ListView.builder(
            itemCount: categoria.metas.length,
            itemBuilder: (context, index) {
              final meta = categoria.metas[index];
              return ListTile(
                title: Text(
                  meta.descricao,
                  style: TextStyle(
                    decoration: meta.isCompleta ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
                trailing: Checkbox(
                  value: meta.isCompleta,
                  onChanged: (value) {
                    metaViewModel.updateMeta(categoriaNome, index);
                  },
                ),
                onLongPress: () {
                  metaViewModel.removeMeta(categoriaNome, index);
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
              final TextEditingController metaController = TextEditingController();
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
                      if (metaController.text.isNotEmpty) {
                        metaViewModel.addMeta(categoriaNome, metaController.text);
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Text('Adicionar meta'),
                  ),
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
