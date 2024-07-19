
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metinhas/app/metas/metas_module.dart';
import 'package:metinhas/app/routes/routes.dart';

import 'app_controller.dart';
import 'categoria/categoria_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [MetasModule(), CategoriaModule()];

  @override
  void binds(Injector i) {
    i.addSingleton<AppController>(AppController.new);
    super.binds(i);
  }

  @override
  void routes(r) {
    r.module(
      Modular.initialRoute,
      module: CategoriaModule(),
    );

    r.module('/$telaPrincipal', module: CategoriaModule());
    r.module('/$metas', module: MetasModule());

    super.routes(r);
  }
}
