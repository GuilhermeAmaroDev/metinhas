import 'package:flutter/foundation.dart';

class MetasNotifier<T> extends ValueNotifier<List<T>> {
  MetasNotifier() : super([]);

  void add(T item) {
    value = [...value, item];
    notifyListeners();
  }

  void update(int index, T item) {
    if (index >= 0 && index < value.length) {
      value[index] = item;
      notifyListeners();
    }
  }

  void removeAt(int index) {
    if (index >= 0 && index < value.length) {
      value = [...value]..removeAt(index);
      notifyListeners();
    }
  }

  void clear() {
    value = [];
    notifyListeners();
  }
}
