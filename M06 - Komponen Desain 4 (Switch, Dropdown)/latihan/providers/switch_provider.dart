import 'package:flutter/material.dart';

class SwitchProvider extends ChangeNotifier {
  bool _showDrop = false;
  bool get showDrop => _showDrop;

  set showDrop(val) {
    _showDrop = val;
    notifyListeners();
  }
}