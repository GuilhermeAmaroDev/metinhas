import 'package:flutter/material.dart';
import 'package:metinhas/app/meta_selecionada/meta_categoria_model.dart';
import 'package:metinhas/app/meta_selecionada/meta_selecionada_page.dart';
import 'package:metinhas/app/notifiers/tarefa_notifier.dart';

class MetasPage extends StatelessWidget {
  final MetasNotifier metasNotifier;

  const MetasPage({required this.metasNotifier, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metinhas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.purple[700],
      ),
      body: ValueListenableBuilder<List<CategoriaMeta>>(
        valueListenable: metasNotifier,
        builder: (context, categorias, _) {
          if (categorias.isEmpty) {
            return const Center(
              child: Text('Nenhuma categoria encontrada', style: TextStyle(fontSize: 18)),
            );
          }

          return ListView.builder(
            itemCount: categorias.length,
            itemBuilder: (context, index) {
              final categoria = categorias[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: _getCardColor(index),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MetaSelecionadaPage(
                          categoriaNome: categoria.nome,
                          metasNotifier: metasNotifier,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      categoria.nome,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicionar nova meta
        },
        child: const Icon(Icons.add),

      ),
    );
  }

  Color _getCardColor(int index) {
    const colors = [
      Color(0xFFB3E5FC), // Light Blue
      Color(0xFFB9FBC0), // Light Green
      Color(0xFFFFE0B2), // Light Orange
      Color(0xFFD1C4E9), // Light Purple
      Color(0xFFFFABAB), // Light Red
    ];
    return colors[index % colors.length];
  }
}
