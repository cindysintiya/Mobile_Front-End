import 'package:flutter/material.dart';

class ProdukProvider extends ChangeNotifier {  // ChangeNotifier : supaya bs pake method yg ada sperti notifyListeners(); mirip setState()
  String titleScreen = 'List Product';

  final List<Map<String, String>> _keranjang = [];
  List<Map<String, String>> get keranjang => _keranjang;
  set isiKeranjang(val) {  // set dan get = akses baca tulis
    _keranjang.add(val);
    notifyListeners();  // utk mengisi keranjang
  }

  TextEditingController tasCtrl = TextEditingController();

  bool _isTasAdd = false;
  bool get isTasAdd => _isTasAdd;
  set setTasStatus(val) {
    _isTasAdd = val;
    notifyListeners();
  }
}