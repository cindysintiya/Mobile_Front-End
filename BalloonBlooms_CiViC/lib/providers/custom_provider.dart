import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class CustomProvider extends ChangeNotifier {
  final List ballType = ['Choose Type', 'Original', 'Heart-Shaped', 'Star-Shaped'];
  final List ribType = ['Choose Type', 'Satin Ribbon', 'Grossgrain Ribbon'];
  final List colors = ['Choose Color', 'Red', 'Rose-Gold', 'Gold'];
  final Map _accessories = {'Doll-Bear': false, 'Flower': false, 'Snacks': false, 'Money': false};
  final Map _budget = {'Doll-Bear': 50000, 'Flower': 50000, 'Snacks': 50000, 'Money': 50000};
  final List cellophanes = ['Choose Color', 'Red', 'Pink', 'Purple', 'Blue', 'Nude', 'Green-Mint', 'Brown'];
  final List payMeth = ['Choose Payment', 'COD', 'M-Banking', 'E-Wallet', 'VA Transfer'];

  String _balloon = 'Choose Type';
  String get balloon => _balloon;
  set balloon(val) {
    _balloon = val;
    notifyListeners();
  }
  String _ribbon = 'Choose Type';
  String get ribbon => _ribbon;
  set ribbon(val) {
    _ribbon = val;
    notifyListeners();
  }
  String _bColor = 'Choose Color';
  String get bColor => _bColor;
  set bColor(val) {
    _bColor = val;
    notifyListeners();
  }
  String _rColor = 'Choose Color';
  String get rColor => _rColor;
  set rColor(val) {
    _rColor = val;
    notifyListeners();
  }
  Map get accessories => _accessories;
  set accessories(val) {
    _accessories[val] = !accessories[val];
    notifyListeners();
  }
  String _cellophane = 'Choose Color';
  String get cellophane => _cellophane;
  set cellophane(val) {
    _cellophane = val;
    notifyListeners();
  }
  Map get budget => _budget;
  changeBudget(key, val) {
    _budget[key] = val;
    notifyListeners();
  }
  TextEditingController accNotes = TextEditingController();
  TextEditingController cardNotes = TextEditingController();

  TextEditingController address = TextEditingController();

  DateTime _date = DateTime.now().add(const Duration(days: 5));
  DateTime get date => _date;
  set date(val) {
    _date = val;
    notifyListeners();
  }

  final TextEditingController _time = TextEditingController();
  TextEditingController get time => _time;
  TimeOfDay _time2 = TimeOfDay.now();
  TimeOfDay get time2 => _time2;
  set time(val) {
    _time.text = val;
    notifyListeners();
  }
  set time2(val) {
    _time2 = val;
    notifyListeners();
  }

  final TextEditingController _dateTime = TextEditingController();
  TextEditingController get dateTime => _dateTime;
  set dateTime(val) {
    _dateTime.text = val;
    notifyListeners();
  }

  //  cek ada gbr atau tdk
  bool _isImageLoaded = false;
  bool get isImageLoaded => _isImageLoaded;
  set isImageLoaded(val) {
    _isImageLoaded = val;
    notifyListeners();
  }

  final ImagePicker _imagePicker = ImagePicker();

  XFile? _img;
  XFile? get img => _img;
  set img(val) {
    _img = val;
    notifyListeners();
  }

  pickedImage(bool isGallery) async {
    try {
      var res = await _imagePicker.pickImage(source: isGallery? ImageSource.gallery: ImageSource.camera);
      if (res != null) {
        img = res;
        isImageLoaded = true;
      }
    }
    catch (e) {
      isImageLoaded = false;
    }
  }
}