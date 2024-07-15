
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metinhas/app/metas/metas_page.dart';

class MetasModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {
   // i.addSingleton<MetasController>(MetasController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => MetasPage());

    super.routes(r);
  }
}