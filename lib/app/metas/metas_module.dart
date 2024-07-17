import 'package:flutter_modular/flutter_modular.dart';
import 'package:metinhas/app/categoria/categoria_controller.dart';
import 'package:metinhas/app/categoria/categoria_model.dart';
import 'package:metinhas/app/categoria/categoria_view_model.dart';
import 'package:metinhas/app/metas/meta_view_model.dart';
import 'package:metinhas/app/metas/metas_page.dart';
import 'package:metinhas/app/notifiers/value_notifier.dart';

class MetasModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {
   // i.addSingleton<MetasNotifier>(MetasNotifier());
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => MetasPage(
        metasNotifier: Modular.get<MetasNotifier<CategoriaMeta>>(),
        controller: Modular.get<CategoriaController>(),
        metasViewModel: Modular.get<MetaViewModel>(), // Se precisar do view model
      ),
    );
    super.routes(r);
  }
}