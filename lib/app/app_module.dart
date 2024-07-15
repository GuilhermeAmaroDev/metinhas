

import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'metas/metas_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {
    i.addSingleton<AppController>(AppController.new);
    super.binds(i);
  }

  @override
  void routes(r) {
    r.module(
      Modular.initialRoute,
      module: MetasModule(),
    );

    super.routes(r);
  }
}
