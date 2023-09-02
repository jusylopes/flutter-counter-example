import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0;
  bool _toggleImage = true;

  int get counter => _counter;
  bool get toglleImage => _toggleImage;

  void incrementCounter() {
    _counter++;
    toggleImageWithDelay();
    notifyListeners();
  }

  void reloadCounter() {
    _counter = 0;
    notifyListeners();
  }

  void toggleImageWithDelay() {
    _toggleImage = !_toggleImage;

    if (!_toggleImage) {
      Future.delayed(const Duration(milliseconds: 200), () {
        _toggleImage = true;
        notifyListeners();
      });
    }
  }
}
