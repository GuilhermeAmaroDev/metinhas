// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppController on _AppControllerBase, Store {
  late final _$metaAtom =
      Atom(name: '_AppControllerBase.meta', context: context);

  @override
  Meta? get meta {
    _$metaAtom.reportRead();
    return super.meta;
  }

  @override
  set meta(Meta? value) {
    _$metaAtom.reportWrite(value, super.meta, () {
      super.meta = value;
    });
  }

  late final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase', context: context);

  @override
  void setMeta(Meta value) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.setMeta');
    try {
      return super.setMeta(value);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
meta: ${meta}
    ''';
  }
}
