import 'package:flutter/material.dart';

class ValueNotifierList<T> extends ValueNotifier<List<T>> {
  ValueNotifierList(super.value);

  void add(T value) {
    this.value.add(value);
    notifyListeners();
  }

  void addAll(List<T> values) {
    value.addAll(values);
    notifyListeners();
  }

  void replace(T valueOld, T valueNew) {
    var index = value.indexOf(valueOld);
    value[index] = valueNew;
    notifyListeners();
  }

  void remove(T value) {
    this.value.remove(value);
    notifyListeners();
  }
}
