import 'package:flutter_modular/flutter_modular.dart';
import 'package:metinhas/app/metas/controller/metas_page_controller.dart';
import 'package:metinhas/app/metas/metas_page.dart';
import 'package:metinhas/app/metas/repositories/metas_repository.dart';
import 'package:metinhas/app/metas/services/metas_service.dart';

class MetasModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<MetasPageController>(MetasPageController.new);
    i.add<MetaRepository>(MetaRepository.new);
    i.add<MetaService>(MetaService.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => const MetasPage());
    super.routes(r);
  }
  }

