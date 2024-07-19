import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metinhas/app/app_widget.dart';
import 'app/app_module.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<void> main() async {
  databaseFactory = databaseFactoryFfi;
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ModularApp(
      module: AppModule(), child: const AppWidget(),
    
    ),
  );
  
}
