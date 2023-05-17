import 'package:flutter/material.dart';

class LatihanProvider extends ChangeNotifier {
  List ringtones = ['None', 'Callisto', 'Ganymede', 'Luna', 'Oberon', 'Phobos', 'Dione'];
  String _chosen = 'None';
  String get chosen => _chosen;
  
  set chosen(val) {
    _chosen = val;
    notifyListeners();
  }
}