import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  final List _myOrder = [
    {
      'Burger' : {
        'Roti Atas': {'qty': 1, 'price': 3000},
        'Selada' : {'qty': 1, 'price': 1000},
        'Timun' : {'qty': 1, 'price': 1000},
        'Ikan' : {'qty': 1, 'price': 10000},
        'Onion Ring' : {'qty': 1, 'price': 4000},
        'Bayam' : {'qty': 1, 'price': 3000},
        'Roti Bawah': {'qty': 1, 'price': 3000},
      },
      'TtlQty' : 7,
      'TtlPrice' : 25000,
      'Creator' : 'btrice',
      'Name' : 'fish n fresh',
      'TtlLikes' : 7,
      'liked': false,
      'Addition' : {
        'Minuman' : {'Coca-Cola': 8000},
        'Kentang Goreng' : {'Kecil': 6000}
      },
      'FinalPrice': 39000,
      'Contact': {
        'Nama': 'Victoria',
        'No HP': '082111110515',
        'Gender': 'Perempuan',
        'Pembayaran': 'Kartu Kredit',
        'Waktu' : '11 Agustus 2023  20:20',
        'Pick Up' : '21:22'
      },
      'Order': {
        'Code' : 987654,
        'Status' : 'Siap untuk di Pick-Up'
      }
    },
    {
      'Burger' : {
        'Roti Atas': {'qty': 1, 'price': 3000},
        'Bombai' : {'qty': 1, 'price': 2000},
        'Timun' : {'qty': 1, 'price': 1000},
        'Jamur' : {'qty': 1, 'price': 4000},
        'Telur' : {'qty': 1, 'price': 5000},
        'Sapi' : {'qty': 1, 'price': 12000},
        'Paprika' : {'qty': 1, 'price': 5000},
        'Roti Bawah': {'qty': 1, 'price': 3000},
      },
      'TtlQty' : 8,
      'TtlPrice' :35000,
      'Creator' : 'kr1st0bal',
      'Name' : 'BalenciagA',
      'TtlLikes' : 2,
      'liked': false,
      'Addition' : {
        'Minuman' : {'Fanta': 8000, 'Sprite': 8000},
        'Kentang Goreng' : {'Besar': 12000},
        'Es Krim' : {'Vanila': 9000, 'Coklat': 9000, 'Stroberi': 9000}
      },
      'FinalPrice': 90000,
      'Contact': {
        'Nama': 'Cindy',
        'No HP': '082111110347',
        'Gender': 'Perempuan',
        'Pembayaran': 'COD',
        'Waktu' : '25 Mei 2023  12:34',
        'Pick Up' : '13:57'
      },
      'Order': {
        'Code' : 123456,
        'Status' : 'Sudah di Pick-Up'
      }
    },
  ];
  List get myOrder => _myOrder;

  set addOrder(val) {
    _myOrder.insert(0, val);
    notifyListeners();
  }

  bool _quickOrder = false;
  bool get quickOrder => _quickOrder;
  set quickOrder(val) {
    _quickOrder = val;
    notifyListeners();
  }

  set sudahPickup(val) {
    _myOrder[val]['Order']['Status'] = 'Sudah di Pick-Up';
    notifyListeners();
  }

  TextEditingController confirmCode = TextEditingController();
  String _confirmStatus = '';
  String get confirmStatus => _confirmStatus;
  set confirmStatus(val) {
    _confirmStatus = val;
    notifyListeners();
  }
}