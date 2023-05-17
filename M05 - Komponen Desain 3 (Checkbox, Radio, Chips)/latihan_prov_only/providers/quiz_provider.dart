import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  // inisialisasi nilai awal
  bool _diSekolah = false;
  bool _diPraktik = false;
  bool _diKursus = false;

  // return nilai dr sekolah, praktik, dst
  bool get statusSekolah => _diSekolah;
  bool get statusPraktik => _diPraktik;
  bool get statusKursus => _diKursus;

  // perubahan state, memakai konsep listen
  set statusSekolah(val) {
    _diSekolah = val;
    notifyListeners();
  }

  set statusPraktik(val) {
    _diPraktik = val;
    notifyListeners();
  }

  set statusKursus(val) {
    _diKursus = val;
    notifyListeners();
  }
}
