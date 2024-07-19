import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:metinhas/app/categoria/categoria_model.dart';
import 'package:metinhas/app/metas/metas_page.dart';
import 'package:metinhas/app/metas/metas_page_controller.dart';
import 'package:metinhas/app/metas/metas_repository.dart';
import 'package:metinhas/app/notifiers/value_notifier.dart';

class MetasModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<MetasPageController>(MetasPageController.new);
    i.add<MetaRepository>(MetaRepository.new);
    i.add<MetasNotifier<List<Categoria>>>(MetasNotifier.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => const MetasPage());
    super.routes(r);
  }
  }

