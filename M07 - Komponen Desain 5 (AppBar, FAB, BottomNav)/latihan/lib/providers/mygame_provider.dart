import 'dart:math';

import 'package:flutter/material.dart';

class MyGameProvider extends ChangeNotifier {
  // final List darat = ['Landak🦔', 'Ayam🐓', 'Domba🐏', 'Gorila🦍', 'Anjing🐕', 'Macan🐆', 'Babi🐖', 'Harimau🐅', 'Monyet🐒', 'Zebra🦓', 'Kucing🐈‍⬛', 'Gajah🐘', 'Kelinci🐇', 'Kukang🦥', 'Kangguru🦘'];
  // final List laut = ['Ikan Dori🐠', 'Kura-Kura🐢', 'Gurita🐙', 'Hiu🦈', 'Lumba-Lumba🐬', 'Paus🐳', 'Buntal🐡', 'Anjing Laut🦭', 'Kepiting🦀', 'Udang🦐', 'Lobster🦞', 'Ikan🐟', 'Unta🐫', 'Sapi🐄'];
  // final List udara = ['Elang🦅', 'Kupu-Kupu🦋', 'Lebah🐝', 'Lalat🪰', 'Nyamuk🦟', 'Kepik🐞', 'Naga🐉', 'Beo🦜', 'Burung Hantu🦉', 'Kelelawar🦇'];

  final List darat = ['Landak+\u{1f994}', 'Ayam+\u{1f413}', 'Domba+\u{1f40f}', 'Gorila+\u{1f98d}', 'Anjing+\u{1f415}', 'Macan+\u{1f406}', 'Babi+\u{1f416}', 'Monyet+\u{1f412}', 'Kucing+\u{1f408}', 'Gajah+\u{1f418}', 'Kelinci+\u{1f407}', 'Kukang+\u{1f9a5}', 'Kangguru+\u{1f998}', 'Unta+\u{1f42a}', 'Sapi+\u{1f404}'];
  final List laut = ['Ikan Dori+\u{1f420}', 'Kura-Kura+\u{1f422}', 'Gurita+\u{1f419}', 'Hiu+\u{1f988}', 'Lumba-Lumba+\u{1f42c}', 'Paus+\u{1f433}', 'Buntal+\u{1f421}', 'Anjing Laut+\u{1f9ad}', 'Kepiting+\u{1f980}', 'Udang+\u{1f990}', 'Lobster+\u{1f99e}', 'Ikan+\u{1f41f}'];
  final List udara = ['Elang+\u{1f985}', 'Kupu-Kupu+\u{1f98b}', 'Lebah+\u{1f41d}', 'Lalat+\u{1fab0}', 'Nyamuk+\u{1f99f}', 'Kepik+\u{1f41e}', 'Naga+\u{1f409}', 'Beo+\u{1f99c}', 'Burung Hantu+\u{1f989}', 'Kelelawar+\u{1f987}'];

  List get hewanAll => darat + laut + udara;

  randHewan() {
    return hewanAll[Random().nextInt(hewanAll.length-1)];
  }

  int _score = 0;
  int get score => _score;

  int _point = Random().nextInt(50)+50;
  int get point => _point;

  bool _tepat = true;
  bool get tepat => _tepat;

  randPoint() {
    _point = Random().nextInt(50)+50;
    notifyListeners();
  }

  set gainPoint(int val) {
    _tepat = true;
    _score += val;
    notifyListeners();
  }
  set minPoint(int val) {
    _tepat = false;
    _score -= val;
    notifyListeners();
  }

  List<Map> _board = [
    {'name': 'Cindy', 'score': 2111},
    {'name': 'VSCod', 'score': 1034},
    {'name': 'Darto', 'score': 799},
    {'name': 'Flutt', 'score': 456},
    {'name': 'Provi', 'score': 150},
    {'name': 'YOU', 'score': 0}
  ];
  List<Map> get board => _board;

  finishGame() {
    _board.firstWhere((player) => player['name']=='YOU')['score'] = _score;
    _board.sort((a, b) => a['score'].compareTo(b['score']));
    _board = _board.reversed.toList();
    _score = 0;
    randPoint();
    _tepat = true;
    notifyListeners();
  }

  List gameRules = [
    'Kamu harus memilih Habitat yang sesuai dengan hewan yang muncul di FloatingActionButton.',
    'Kamu hanya punya 1 (satu) kesempatan untuk memilih jawaban (Habitat) yang benar di BottomNavigation.',
    'Cara lain untuk memilih adalah dengan menekan FloatingActionButton dan jawaban (Habitat) terpilih adalah Habitat yang sedang tampil/ muncul di layar saat ini.',
    'Jika jawaban yang dipilih benar, kamu akan mendapatkan tambahan poin acak, tapi jika kamu memilih jawaban yang salah, kamu akan mendapatkan pengurangan poin acak juga.',
    'Jadi, berhati-hatilah saat memilih jawaban, tapi jangan terlalu dibawa serius. Ini hanya "Game".',
    'Untuk menghentikan/ menyelesaikan permainan, kamu bisa menekan tombol bendera di sudut kanan atas layar.',
    'Permainan juga akan berhenti otomatis jika skor Anda < 0.'
  ];
}