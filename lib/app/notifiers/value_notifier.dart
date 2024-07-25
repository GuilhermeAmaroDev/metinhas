import 'package:flutter/material.dart';

class ValueNotifierList<T> extends ValueNotifier<List<T>> {
  ValueNotifierList(super.value);

  void add(T item) {
    value = [...value, item];
    notifyListeners();
  }

  void update(int index, T item) {
    value[index] = item;
    notifyListeners();
  }

  void remove(T item) {
    value = value.where((i) => i != item).toList();
    notifyListeners();
  }
}
