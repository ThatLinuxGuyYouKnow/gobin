import 'package:flutter/material.dart';

class LoaderState extends ChangeNotifier {
  bool loaderIsVisible = false;

  makeLoaderVisible() {
    loaderIsVisible = true;
    notifyListeners();
  }

  removeLoader() {
    loaderIsVisible = false;
    notifyListeners();
  }
}
