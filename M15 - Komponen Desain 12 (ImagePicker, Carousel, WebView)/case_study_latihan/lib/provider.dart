import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Pertemuan15Provider extends ChangeNotifier {
  bool _isImageLoaded = false;
  bool get isImageLoaded => _isImageLoaded;
  set isImageLoaded(val) {
    _isImageLoaded = val;
    notifyListeners();
  }

  // image picker
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
      print(e.toString());
    }
  }
}