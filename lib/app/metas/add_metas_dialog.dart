import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metinhas/app/notifiers/tarefa_notifier.dart';

class AddMetaDialog extends StatelessWidget {
  final TextEditingController metaController = TextEditingController();
  final MetasNotifier metasNotifier;

  AddMetaDialog({super.key, required this.metasNotifier});

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
          onPressed: () async {
            if (metaController.text.isNotEmpty) {
              metasNotifier.addMeta(metaController.text);
              await Modular.to.pushReplacementNamed('/');
              Navigator.of(context).pop();
            }
          },
          child: const Text('Adicionar meta'),
        ),
      ],
    );
  }
}