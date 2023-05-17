import 'package:flutter/material.dart';

class LatihanProvider extends ChangeNotifier {
  TextEditingController username = TextEditingController();
  TextEditingController userphone = TextEditingController();
  String _status = 'new';
  String get status => _status;

  set status(val) {
    _status = val;
    notifyListeners();
  }

  Map _userInfo = {
    'username' : 'who?',
    'userphone' : '-'
  };
  Map get userInfo => _userInfo;

  set login(val) {
    _userInfo.clear();
    _userInfo.addAll(val);
    notifyListeners();
  }
  logout() {
    _userInfo = {
      'username' : 'who?',
      'userphone' : '-'
    };
    _status = 'new';
    notifyListeners();
  }

  final List _wishlist = [];
  List get wishlist => _wishlist;
  set wishlist(val) {
    if (_wishlist.contains(val)) {
      _wishlist.remove(val);
    }
    else {
      _wishlist.add(val);
    }
    notifyListeners();
  }
}