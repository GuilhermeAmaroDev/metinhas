import 'categoria_view_model.dart';

class CategoriaController {
  final CategoriaViewModel viewModel;

  CategoriaController(this.viewModel);

  Future<void> loadCategorias() {
    return viewModel.initializeCategorias();
  }
}
