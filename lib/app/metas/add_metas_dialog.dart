import 'package:flutter/material.dart';
import 'package:metinhas/app/notifiers/tarefa_notifier.dart';

class AddMetaDialog extends StatelessWidget {
  final TextEditingController metaController = TextEditingController();
  final MetasNotifier metasNotifier;
  final String tipo;

  AddMetaDialog({super.key, required this.metasNotifier, required this.tipo});

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
              metasNotifier.addMeta(tipo, metaController.text);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Adicionar meta'),
        ),
      ],
    );
  }
}