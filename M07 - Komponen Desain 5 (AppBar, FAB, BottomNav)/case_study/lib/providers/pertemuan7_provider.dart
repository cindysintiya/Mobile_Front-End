import 'package:flutter/material.dart';

class Pertemuan7Provider extends ChangeNotifier {
  int _ttlNotif = 0;
  int get ttlNotif => _ttlNotif;

  set ttlNotif(int val) {
    _ttlNotif += val;
    notifyListeners();
  }

  resetNotif() {
    _ttlNotif = 0;
    notifyListeners();
  }
}