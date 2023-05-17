import 'package:flutter/material.dart';

class Soal1Provider extends ChangeNotifier {
  // inisialisasi nilai awal
  bool _soal1a = false;
  bool _soal1b = false;

  // return nilai dr sekolah, praktik, dst
  bool get soal1a => _soal1a;
  bool get soal1b => _soal1b;

  // perubahan state, memakai konsep listen
  set soal1a(val) {
    _soal1a = val;
    notifyListeners();
  }

  set soal1b(val) {
    _soal1b = val;
    notifyListeners();
  }
}