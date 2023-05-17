import 'package:flutter/material.dart';

class PeminatanProvider extends ChangeNotifier {
  // inisialisasi nilai awal
  bool _TKJ = false;
  bool _RPL = false;
  bool _SMA = false;
  final List _terpilih = [];

  // return nilai dr sekolah, praktik, dst
  bool get statusTKJ => _TKJ;
  bool get statusRPL => _RPL;
  bool get statusSMA => _SMA;
  List get terpilih => _terpilih;

  // perubahan state, memakai konsep listen
  set statusTKJ(val) {
    _TKJ = val;
    notifyListeners();
  }

  set statusRPL(val) {
    _RPL = val;
    notifyListeners();
  }

  set statusSMA(val) {
    _SMA = val;
    notifyListeners();
  }

  set pilihan(val) {
    if (terpilih.contains(val)) {
      terpilih.remove(val); // klo val ud ada dilist, di remove
    } else {
      terpilih.add(val); // klo val tdk ada dilist, di add
    }
    notifyListeners();
  }
}