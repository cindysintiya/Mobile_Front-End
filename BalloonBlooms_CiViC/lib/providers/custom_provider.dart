import 'package:flutter/material.dart';

class CustomProvider extends ChangeNotifier {
  final List ballType = ['Original', 'Heart-Shaped', 'Star-Shaped'];
  final List ribType = ['Satin Ribbon', 'Grossgrain Ribbon'];
  final List colors = ['Red', 'Rose-Gold', 'Gold'];
  Map accessories = {'Doll-Bear': false, 'Flower': false, 'Snacks': false, 'Money': false};
  final List cellophanes = ['Red', 'Pink', 'Purple', 'Blue', 'nude', 'Green-Mint', 'Brown'];
  final List payMeth = ['COD', 'M-Banking', 'E-Wallet', 'VA Transfer'];

  String _balloon = '';
  String get balloon => _balloon;
  String _ribbon = '';
  String get ball => _ribbon;
  String _color = '';
  String get color => _color;
  String _cellophane = '';
  String get cellophane => _cellophane;
  int _budget = 10000;
  int get budget => _budget;
  TextEditingController accNotes = TextEditingController();
  TextEditingController cardNotes = TextEditingController();

  TextEditingController address = TextEditingController();

}