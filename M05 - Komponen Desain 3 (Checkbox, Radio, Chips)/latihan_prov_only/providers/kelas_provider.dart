import 'package:flutter/material.dart';

class KelasProvider extends ChangeNotifier {
  // inisialisasi nilai awal
  bool _kelasPagi = false;
  bool _kelasSiang = false;

  // return nilai dr sekolah, praktik, dst
  bool get kelasPagi => _kelasPagi;
  bool get kelasSiang => _kelasSiang;

  // perubahan state, memakai konsep listen
  set pagi(val) {
    _kelasPagi = val;
    _kelasSiang = !val;
    notifyListeners();
  }

  set siang(val) {
    _kelasPagi = !val;
    _kelasSiang = val;
    notifyListeners();
  }
}
