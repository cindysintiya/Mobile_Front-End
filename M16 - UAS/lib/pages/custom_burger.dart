import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b_kreazi/providers/burger_provider.dart';
import 'package:b_kreazi/providers/navigation_provider.dart';

class CustomBurger extends StatefulWidget {
  const CustomBurger({super.key, required this.title});

  final String title;

  @override
  State<CustomBurger> createState() => _CustomBurgerState();
}

class _CustomBurgerState extends State<CustomBurger> {
  @override
  Widget build(BuildContext context) {
    final provBurger = Provider.of<BurgerProvider>(context);
    final provNav = Provider.of<NavigationProvider>(context);
    return SingleChildScrollView(
      child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            Padding(
              padding: const EdgeInsets.only(right: 180),
              child: Image.asset(
                'assets/Roti Atas.png', 
              ),
            ),
            Column(
              children: provBurger.chosenComponent.entries.map((component) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/${component.key}.png', 
                      width: 180,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all()
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            splashRadius: 15,
                            onPressed: component.value['qty']>1? () {provBurger.minQty = component.key;} : null, 
                            icon: const Icon(Icons.remove)
                          ),
                          Text(component.value['qty'].toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                          IconButton(
                            splashRadius: 15,
                            onPressed: component.value['qty']<3? () {provBurger.addQty = component.key;} : null, 
                            icon: const Icon(Icons.add)
                          ),
                        ]
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      width: 90,
                      child: Text('${NumberFormat.currency(locale: "id_ID", symbol: "Rp. ", decimalDigits: 0).format(component.value["price"])},-'),
                    ),
                  ],
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 180),
              child: Image.asset(
                'assets/Roti Bawah.png', 
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      provNav.orderState = 'Choose';
                    },
                    child: const Text('Kembali'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      provBurger.addFinal();
                      provNav.orderState = 'Addition';
                    },
                    child: const Text('Lanjut: Tambahan'),
                  ),
                ],
              ),
            )
          ],
      ),
    );
  }
}