import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:case_study_provider/provider/produk_provider.dart';
import 'package:case_study_provider/provider/produk2_screen.dart';

class Keranjang2 extends StatelessWidget {
  const Keranjang2({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProdukProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Keranjang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text('List Belanja', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
            Divider(),

            // List Keranjang
            Column(
              children: provider.keranjang.map((val) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // kiri
                    Text('${val['title']}', style: const TextStyle(fontWeight: FontWeight.bold,),),
                    // kanan
                    Text('${val['total']} item'),
                  ]
                );
              }).toList(),
            ),

            // Button CheckOut
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  provider.keranjang.clear();
                  Navigator.pop(context);
                },
                child: const Text('CheckOut'),
              ),
            )
          ],
        ),
      ),
    );
  }
}