import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metinhas/app/categoria/categoria_controller.dart';
import 'package:metinhas/app/categoria/categoria_repository.dart';
import 'package:metinhas/app/categoria/tela_principal.dart';

import 'categoria_model.dart';
import 'categoria_service.dart';

class CategoriaModule extends Module {
  @override
  List<Module> get imports => [
  ];

  @override
  void binds(Injector i) {
    i.addSingleton<CategoriaController>(CategoriaController.new);
    i.add<CategoriaService>(CategoriaService.new);
    i.add<CategoriaRepository>(CategoriaRepository.new);
    i.add<ValueNotifier<List<Categoria>>>(ValueNotifier.new);

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => const TelaPrincipal());

    super.routes(r);
  }
}