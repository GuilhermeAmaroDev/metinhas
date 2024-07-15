import 'package:flutter/material.dart';
import 'package:metinhas/app/metas/metas_page.dart';

void main() {
  runApp(const MetinhasApp());
}

class MetinhasApp extends StatelessWidget {
  const MetinhasApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Metinhas App',
     theme: ThemeData(
       primarySwatch: Colors.blue
     ),
     home: MetasPage(),
   );
  }
}

