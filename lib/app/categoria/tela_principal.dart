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
            // borderRadius: BorderRadius.vertical(
            //   bottom: Radius.circular(30),
            // ),
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
          builder: (_, categorias, __) {
            if (categorias.isEmpty) {
              return const Center(
                child: Text(
                  'Nenhuma categoria encontrada',
                  style: TextStyle(fontSize: 18),
                ),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                final categoria = categorias[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MetasPage(),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        categoria.icon,
                        size: 50,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        categoria.nome,
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ],
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
                  _buildIconOption(Icons.person, selectedIcon, (icon) {
                    selectedIcon = icon;
                  }),
                  _buildIconOption(Icons.attach_money, selectedIcon, (icon) {
                    selectedIcon = icon;
                  }),
                  _buildIconOption(Icons.work, selectedIcon, (icon) {
                    selectedIcon = icon;
                  }),
                  _buildIconOption(Icons.health_and_safety, selectedIcon, (icon) {
                    selectedIcon = icon;
                  }),
                  _buildIconOption(Icons.videogame_asset, selectedIcon, (icon) {
                    selectedIcon = icon;
                  }),
                  _buildIconOption(Icons.airplanemode_active, selectedIcon, (icon) {
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
                  controller.addCategoria(newCategoriaNome, selectedIcon!);
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
        setState(() {});
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
