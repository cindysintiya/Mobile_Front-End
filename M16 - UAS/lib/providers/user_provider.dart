import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  TextEditingController nama = TextEditingController();
  TextEditingController noHp = TextEditingController();
  String gender = 'Laki-Laki';

  final Map _userInfo = {};
  Map get userInfo => _userInfo;

  set changeGender(val) {
    gender = val;
    notifyListeners();
  }

  set saveUser(Map val) {
    _userInfo.addAll(val);
    nama.text = _userInfo['Nama'];
    noHp.text = _userInfo['No HP'];
    changeGender = _userInfo['Gender'];
    notifyListeners();
  }

  bool _edit = false;
  bool get edit => _edit;
  editState() {
    _edit = !_edit;
    notifyListeners();
  }
}