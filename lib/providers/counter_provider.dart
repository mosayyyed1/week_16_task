import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void decrementCounter() {
    if (counter > 0) {
      counter--;
      notifyListeners();
    }
  }
}
