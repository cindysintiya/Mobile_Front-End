import 'package:flutter/material.dart';

class Pertemuan13Provider extends ChangeNotifier {
  double _sliderValue = 0;
  double get sliderValue => _sliderValue;
  set sliderValue(val) {
    _sliderValue = val;
    notifyListeners();
  }

  bool _sedangMemanggang = false;
  bool get sedangMemanggang => _sedangMemanggang;
  set sedangMemanggang(val) {
    _sedangMemanggang = val;
    notifyListeners();
  }

  mulaiMemanggang(int val) async {
    sedangMemanggang = true;   // memunculkan progress indicator dulu
    Future.delayed(Duration(seconds: val), () { // delay dulu sejenak
      sedangMemanggang = false;   // lanjutkan proses
      selesaiMasak = true;
    });
  }

  bool _selesaiMasak = false;
  bool get selesaiMasak => _selesaiMasak;
  set selesaiMasak(val) {
    _selesaiMasak = val;
    notifyListeners();
  }
}