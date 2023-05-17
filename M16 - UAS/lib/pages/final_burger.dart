import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b_kreazi/providers/burger_provider.dart';
import 'package:b_kreazi/providers/navigation_provider.dart';
import 'package:b_kreazi/components/custom_color.dart';
import 'package:b_kreazi/components/stack_burger.dart';

class FinalBurger extends StatefulWidget {
  const FinalBurger({super.key, required this.title, required this.back});

  final String title;
  final bool back;

  @override
  State<FinalBurger> createState() => _FinalBurgerState();
}

class _FinalBurgerState extends State<FinalBurger> {
  @override
  Widget build(BuildContext context) {
    final provBurger = Provider.of<BurgerProvider>(context);
    final provNav = Provider.of<NavigationProvider>(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StackBurger(source: provBurger.finalComponent, padding: 17.5, width: 150,),
            const SizedBox(height: 5,),
            Text('Total Harga : ${NumberFormat.currency(locale: "id_ID", symbol: "Rp. ", decimalDigits: 0).format(provBurger.finalComponent['TtlPrice']-(provBurger.finalComponent.containsKey('Discount')?provBurger.finalComponent['Discount']:0))},-', style: const TextStyle(fontWeight: FontWeight.bold),),
            const Divider(),
            const Text('Tambahan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: provBurger.additional.entries.map((additional) {
                return Column(
                  children: [
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: additional.value['on'], 
                      title: Text.rich(
                        TextSpan(
                          text: additional.key,
                          children: [
                            TextSpan(
                              text: provBurger.finalAddition.isNotEmpty && provBurger.finalAddition.containsKey(additional.key) && provBurger.finalAddition[additional.key].isEmpty? '    *Wajib pilih salah satu/ minimal satu' : null,
                              style: const TextStyle(color: Colors.red, fontSize: 11)
                            )
                          ]
                        ),
                      ),
                      onChanged: (val) {
                        provBurger.additional = [additional.key, val];
                      }
                    ),
                    Visibility(
                      visible: additional.value['on'],
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: additional.value['option'].entries.map<Widget>((option) {
                              return additional.key=='Kentang Goreng'? 
                                ChoiceChip(
                                  label: Text(option.value? '${option.key} +${additional.value['price'][option.key]/1000}.000' : option.key),
                                  selected: option.value,
                                  selectedColor: myCustomColor()[700],
                                  onSelected: (val) {
                                    provBurger.option = ['Kentang Goreng', option.key, val];
                                  },
                                ) :
                                FilterChip(
                                  label: Text(option.value? '${option.key} +${additional.value['price'][option.key]/1000}.000' : option.key), 
                                  selected: option.value,
                                  selectedColor: myCustomColor()[700],
                                  onSelected: (val) {
                                    provBurger.option = [additional.key, option.key, val];
                                  },
                                );
                            }).toList(),
                        ),
                      )
                    )
                  ],
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: widget.back? () {
                      provNav.orderState = 'Custom';
                    } : () {
                      Navigator.pop(context); 
                      provBurger.resetAll();
                      provNav.orderState = 'Choose';
                    },
                    child: const Text('Kembali'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      provBurger.addAddition();
                      provBurger.resetTime();
                      if ((provBurger.finalAddition.isNotEmpty && provBurger.finalAddition.values.every((element) => element.isNotEmpty) || provBurger.finalAddition.isEmpty)) {
                        provNav.orderState = 'Contact';
                      }
                    },
                    child: const Text('Lanjut: Info kontak'),
                  ),
                ],
              ),
            )
          ],
      ),
    );
  }
}