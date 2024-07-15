
import 'package:mobx/mobx.dart';

import 'metas/metas_model.dart';


part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final ObservableList<Meta> metas = ObservableList<Meta>();

  @observable
  Meta? meta;

  @action
  void setMeta(Meta value) => meta = value;

  Future carregarMetas() async {
    metas.clear();

    // for (final meta in await MetasRepository.getAll()) {
    //   meta.add(
    //     Meta(descricao: ''
    //
    //     ),
    //   );
    // }
  }
}
