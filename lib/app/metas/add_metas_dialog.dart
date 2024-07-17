import 'package:flutter/material.dart';
import 'meta_view_model.dart';


class AddMetaDialog extends StatelessWidget {
  final TextEditingController metaController = TextEditingController();
  final MetaViewModel viewModel;
  final String categoriaNome;

  AddMetaDialog({
    super.key,
    required this.viewModel,
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
              viewModel.addMeta(categoriaNome, metaController.text);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Adicionar meta'),
        ),
      ],
    );
  }
}
