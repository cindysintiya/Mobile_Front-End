import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b_kreazi/providers/burger_provider.dart';
import 'package:b_kreazi/providers/navigation_provider.dart';
import 'package:b_kreazi/components/custom_color.dart';

class ChooseBurger extends StatefulWidget {
  const ChooseBurger({super.key, required this.title});

  final String title;

  @override
  State<ChooseBurger> createState() => _ChooseBurgerState();
}

class _ChooseBurgerState extends State<ChooseBurger> {
  @override
  Widget build(BuildContext context) {
    final provBurger = Provider.of<BurgerProvider>(context);
    final provNav = Provider.of<NavigationProvider>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text.rich(
                TextSpan(
                  text: 'ROTI ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: '  *Wajib',
                      style: TextStyle(fontSize: 12, color: Colors.red)
                    )
                  ]
                ),
              ),
            ),
            Wrap(
              children: ['Atas', 'Bawah'].map((item) => 
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: myCustomColor()),
                    color: myCustomColor()[100],
                  ),
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width/((MediaQuery.of(context).size.width/150).floor())-20,
                  height: 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/Roti $item.png', 
                      ),
                      const SizedBox(width: 7,),
                      Text('Roti $item', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                      const Text('Rp. 3.000,-', style: TextStyle(fontSize: 13),),
                    ],
                  ),
                ),
              ).toList()
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Text.rich(
                TextSpan(
                  text: 'ISIAN ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: '  *Bebas Pilih',
                      style: TextStyle(fontSize: 12, color: Colors.green)
                    )
                  ]
                ),
              ),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: provBurger.burgerComponent.entries.map((component) {
                return GestureDetector(
                  onTap: () {
                    // provBurger.changeComponent = [component.key, !component.value['on']];
                    provBurger.chosenComponent = component.key;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.8, color: component.value['on']? myCustomColor(): Colors.black54),
                      color: component.value['on']? myCustomColor()[100]: Colors.white,
                    ),
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width/((MediaQuery.of(context).size.width/150).floor())-20,
                    height: 130,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/${component.key}.png', 
                        ),
                        const SizedBox(width: 7,),
                        Text(component.key, style: TextStyle(fontWeight: component.value['on']? FontWeight.bold : null, fontSize: 17),),
                        Text('${NumberFormat.currency(locale: "id_ID", symbol: "Rp. ", decimalDigits: 0).format(component.value["price"])},-', style: const TextStyle(fontSize: 13),),
                      ],
                    )
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context, 
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Peringatan!', style: TextStyle(fontWeight: FontWeight.bold),),
                            content: const Text('Kamu akan kehilangan semua progres kustomisasi yang telah kamu lakukan. Yakin ingin kembali?'),
                            actions: [
                              TextButton(onPressed: () {Navigator.pop(context);}, child: const Text('Batal', style: TextStyle(color: Colors.grey),)),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  provNav.orderState = 'Choose';
                                  provBurger.resetComponent();
                                  provBurger.resetChoosen();
                                  provBurger.resetFinal();
                                },
                                child: const Text('Ya')
                              )
                            ],
                          );
                        }
                      );
                    },
                    child: const Text('Batal'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // provBurger.addChosenComponent();
                      provNav.orderState = 'Custom';
                    },
                    child: const Text('Lanjut: Kustom bahan'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}