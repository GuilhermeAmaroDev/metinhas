import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metinhas/app/metas/metas_page_controller.dart';


class AddMetaDialog extends StatelessWidget {
  final TextEditingController metaController = TextEditingController();
  final MetasPageController metasPageController = Modular.get<MetasPageController>();
  final String categoriaNome;

  AddMetaDialog({
    super.key,
    required this.categoriaNome,
  });

  @override
  Widget build(BuildContext context) {
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
              metasPageController.addMeta(categoriaNome, metaController.text);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Adicionar meta'),
        ),
      ],
    );
  }
}
