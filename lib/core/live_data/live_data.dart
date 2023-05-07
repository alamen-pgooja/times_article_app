import 'package:flutter/material.dart';
import 'package:pop_articles/core/live_data/ui_state.dart';

class LiveData<T extends UIState> with ChangeNotifier {
  T? value;

  void setValue(T value) {
    this.value = value;
    notifyListeners();
  }

  UIState getValue() {
    return value!;
  }
}
