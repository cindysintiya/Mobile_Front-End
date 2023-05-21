import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b_kreazi/providers/burger_provider.dart';
import 'package:b_kreazi/providers/officialmenu_provider.dart';
import 'package:b_kreazi/components/menu_card.dart';
import 'package:b_kreazi/components/custom_color.dart';
import 'package:b_kreazi/pages/create_burger.dart';
import 'package:b_kreazi/pages/all_menu.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final provBurger = Provider.of<BurgerProvider>(context);
    final provMenu = Provider.of<OfficialMenuProvider>(context);

    randomRecommend() {
      List rekomen = [];
      for (var i = 0; i < (provMenu.allMenu.length/2.2).floor(); i++) {
        final random =  Random();
        var num = random.nextInt(provMenu.allMenu.length);
        if (rekomen.contains(provMenu.allMenu[num])) { i -= 1; }
        else { rekomen.add(provMenu.allMenu[num]); }
      }
      return rekomen;
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                provBurger.resetAll();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateBurger(back: true,)));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: myCustomColor())
                ),
                child: Image.asset('assets/Kreazikan Banner.png', width: MediaQuery.of(context).size.width,)
              )
            ),
            const SizedBox(height: 20,),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                const Text('Rekomendasi Untukmu', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AllMenu(title: 'Menu Official',)));
                  }, 
                  child: const Text('Lihat Semua')
                )
              ],
            ),
            const SizedBox(height: 5,),
            MenuCard(product: randomRecommend())
          ],
        ),
      ),
    );
  }
}