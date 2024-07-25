import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metinhas/app/app_controller.dart';
import 'package:metinhas/app/categoria/categoria_model.dart';
import 'package:metinhas/app/metas/controller/metas_page_controller.dart';

class MetasPage extends StatefulWidget {


  const MetasPage({super.key});

  @override
  State<MetasPage> createState() => _MetasPageState();
}

class _MetasPageState extends State<MetasPage> {
  final AppController appController = Modular.get<AppController>();
  late final String categoriaNome;
  late final MetasPageController metasPageController;

  @override
  void initState() {
    super.initState();
    appController.carregarCategorias();
    appController.carregarMetas();
    metasPageController = MetasPageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metas $categoriaNome'),
      ),
      body: ValueListenableBuilder<List<Categoria>>(
        valueListenable: appController.categoriasNotifier,
        builder: (context, categorias, _) {
          final categoria = categorias.firstWhere(
                (cat) => cat.nome == categoriaNome,
            orElse: () => Categoria(id: 0, nome: categoriaNome, icon: null),
          );

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
                    setState(() {
                      metasPageController.updateMeta(categoriaNome, index);
                    });
                  },
                ),
                onLongPress: () {
                  setState(() {
                    metasPageController.removeMeta(categoriaNome, index);
                  });
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
                        setState(() {
                          metasPageController.addMeta(categoriaNome, metaController.text);
                        });
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
