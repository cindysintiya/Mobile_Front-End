import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:case_study_provider/provider/produk_provider.dart';
import 'package:case_study_provider/provider/keranjang2_screen.dart';
import 'package:case_study_provider/setstate/components/produk_widget.dart';

class ProdukScreen2 extends StatelessWidget {
  final String username;
  const ProdukScreen2({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<ProdukProvider>().titleScreen),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Keranjang2()));
                },
                icon: const Icon(Icons.shopping_cart),
              ),

              // total item keranjang belanja
              Positioned(
                child: Text(context.watch<ProdukProvider>().keranjang.length.toString(), style: const TextStyle(fontWeight: FontWeight.bold),), 
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ProdukWidget(
              namaProduk: 'Tas',
              ctrl: context.watch<ProdukProvider>().tasCtrl, // membaca/menulis tanpa liat perubahan yg terjadi
              press: () {
                print('tas');
                context.read<ProdukProvider>().setTasStatus = true; // mengubah status tas
                context.read<ProdukProvider>().isiKeranjang = {
                  'title': 'Tas',
                  'total': context.read<ProdukProvider>().tasCtrl.text
                };
              }, 
              status: context.watch<ProdukProvider>().isTasAdd,
            ),
          ],
        ),
      ),
    );
  }
}