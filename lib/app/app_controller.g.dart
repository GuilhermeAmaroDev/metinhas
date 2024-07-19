// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppController on _AppControllerBase, Store {
  late final _$categoriasNotifierAtom =
      Atom(name: '_AppControllerBase.categoriasNotifier', context: context);

  @override
  ValueNotifier<List<Categoria>> get categoriasNotifier {
    _$categoriasNotifierAtom.reportRead();
    return super.categoriasNotifier;
  }

  @override
  set categoriasNotifier(ValueNotifier<List<Categoria>> value) {
    _$categoriasNotifierAtom.reportWrite(value, super.categoriasNotifier, () {
      super.categoriasNotifier = value;
    });
  }

  late final _$carregarCategoriasAsyncAction =
      AsyncAction('_AppControllerBase.carregarCategorias', context: context);

  @override
  Future<void> carregarCategorias() {
    return _$carregarCategoriasAsyncAction
        .run(() => super.carregarCategorias());
  }

  late final _$carregarMetasAsyncAction =
      AsyncAction('_AppControllerBase.carregarMetas', context: context);

  @override
  Future<void> carregarMetas() {
    return _$carregarMetasAsyncAction.run(() => super.carregarMetas());
  }

  @override
  String toString() {
    return '''
categoriasNotifier: ${categoriasNotifier}
    ''';
  }
}
