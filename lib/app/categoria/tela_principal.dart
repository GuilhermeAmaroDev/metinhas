import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metinhas/app/categoria/controller/categoria_controller.dart';
import 'package:metinhas/app/categoria/categoria_model.dart';
import 'package:metinhas/app/metas/metas_page.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final CategoriaController controller = Modular.get<CategoriaController>();

  @override
  void initState() {
    super.initState();
    controller.loadCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Metinhas',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        elevation: 4,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[200]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ValueListenableBuilder<List<Categoria>>(
          valueListenable: controller.categoriasNotifier,
          builder: (context, categorias, _) {
            if (categorias.isEmpty) {
              return const Center(
                child: Text(
                  'Nenhuma categoria encontrada',
                  style: TextStyle(fontSize: 18),
                ),
              );
            }

            return ListView.builder(
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                final categoria = categorias[index];
                return Card(
                  elevation: 6,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MetasPage(
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: _getCardGradient(index),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          if (categoria.icon != null)
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                categoria.icon,
                                size: 32,
                                color: _getIconColor(index),
                              ),
                            ),
                          const SizedBox(width: 16),
                          Text(
                            categoria.nome,
                            style: const TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddCategoriaDialog(context);
        },
        backgroundColor: Colors.purple[300],
        child: const Icon(Icons.add),
      ),
    );
  }

  LinearGradient _getCardGradient(int index) {
    const gradients = [
      LinearGradient(
        colors: [Color(0xFFFFABAB), Color(0xFFFF6F61)], // Light Red
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      LinearGradient(
        colors: [Color(0xFFB9FBC0), Color(0xFF68B984)], // Light Green
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      LinearGradient(
        colors: [Color(0xFFD1C4E9), Color(0xFF9575CD)], // Light Purple
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      LinearGradient(
        colors: [Color(0xFFB3E5FC), Color(0xFF64B5F6)], // Light Blue
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ];
    return gradients[index % gradients.length];
  }

  Color _getIconColor(int index) {
    const colors = [
      Color(0xFFFF6F61), // Light Red
      Color(0xFF68B984), // Light Green
      Color(0xFF9575CD), // Light Purple
      Color(0xFF64B5F6), // Light Blue
    ];
    return colors[index % colors.length];
  }

  void _showAddCategoriaDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newCategoriaNome = '';
        IconData? selectedIcon;

        return AlertDialog(
          title: const Text('Adicionar Categoria'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newCategoriaNome = value;
                },
                decoration: const InputDecoration(labelText: 'Nome da Categoria'),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 10,
                children: [
                  _buildIconOption(Icons.work, selectedIcon, (icon) {
                    selectedIcon = icon;
                  }),
                  _buildIconOption(Icons.home, selectedIcon, (icon) {
                    selectedIcon = icon;
                  }),
                  _buildIconOption(Icons.favorite, selectedIcon, (icon) {
                    selectedIcon = icon;
                  }),
                  _buildIconOption(Icons.health_and_safety, selectedIcon, (icon) {
                    selectedIcon = icon;
                  }),
                ],
              ),
            ],
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
                if (newCategoriaNome.isNotEmpty && selectedIcon != null) {
                  controller.categoriasNotifier.add(
                    Categoria(nome: newCategoriaNome, icon: selectedIcon!),
                  );
                }
                Navigator.of(context).pop();
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildIconOption(IconData icon, IconData? selectedIcon, void Function(IconData) onSelected) {
    return GestureDetector(
      onTap: () {
        onSelected(icon);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(
            color: selectedIcon == icon ? Colors.purple : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(icon, size: 32, color: selectedIcon == icon ? Colors.purple : Colors.black),
      ),
    );
  }
}
