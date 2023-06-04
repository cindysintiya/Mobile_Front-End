import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b_kreazi/providers/navigation_provider.dart';
import 'package:b_kreazi/providers/burger_provider.dart';
import 'package:b_kreazi/components/custom_color.dart';
import 'package:b_kreazi/pages/choose_burger.dart';
import 'package:b_kreazi/pages/custom_burger.dart';
import 'package:b_kreazi/pages/final_burger.dart';
import 'package:b_kreazi/pages/user_info.dart';

class CreateBurger extends StatefulWidget {
  const CreateBurger({super.key, required this.back});

  final bool back;

  @override
  State<CreateBurger> createState() => _CreateBurgerState();
}

class _CreateBurgerState extends State<CreateBurger> {
  @override
  Widget build(BuildContext context) {
    final provNav = Provider.of<NavigationProvider>(context);
    final provBurger = Provider.of<BurgerProvider>(context);
    final Map state = {
      'Choose': const ChooseBurger(title: 'Tahap 1 : Pilih bahan-bahan'),
      'Custom': const CustomBurger(title: 'Tahap 2 : Sesuaikan bahan-bahan'),
      'Addition': FinalBurger(title: 'Tahap 3 : Tambahkan pelengkap', back: widget.back),
      'Contact': const UserInfo(title: 'Tahap 4 : Lengkapi data diri'),
    };
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kreazi-kan Burger-mu'),
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context, 
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Peringatan!', style: TextStyle(fontWeight: FontWeight.bold),),
                  content: const Text('Kamu akan kehilangan semua progres kustomisasi yang telah kamu lakukan. Yakin ingin kembali?', textAlign: TextAlign.justify,),
                  actions: [
                    TextButton(onPressed: () {Navigator.pop(context);}, child: const Text('Batal', style: TextStyle(color: Colors.grey),)),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        provNav.orderState = 'Choose';
                        provBurger.resetAll();
                      },
                      child: const Text('Ya')
                    )
                  ],
                );
              }
            );
          },
          tooltip: 'Cancel Order',
          icon: const Icon(Icons.arrow_back)
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: myCustomColor()[400],
            ),
            padding: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            child: Text(state[provNav.orderState].title, style: const TextStyle(fontSize: 17),),
          ),
          Expanded(
            child: state[provNav.orderState],
          ),
        ],
      ),
    );
  }
}