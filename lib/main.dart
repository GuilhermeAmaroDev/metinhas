import 'package:flutter/material.dart';
import 'package:metinhas/app/metas/metas_page.dart';
import 'package:metinhas/app/notifiers/value_notifier.dart'; // Importar o notificador

void main() {
  runApp(const MetinhasApp());
}

class MetinhasApp extends StatelessWidget {
  const MetinhasApp({super.key});

  @override
  Widget build(BuildContext context) {
    final metasNotifier = MetasNotifier();


    return MaterialApp(
      title: 'Metinhas App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MetasPage(metasNotifier: metasNotifier),
    );
  }
}