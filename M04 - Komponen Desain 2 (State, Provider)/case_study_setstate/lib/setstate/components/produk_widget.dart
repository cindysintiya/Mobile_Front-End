import 'package:flutter/material.dart';

class ProdukWidget extends StatelessWidget {
  final String namaProduk;
  final TextEditingController ctrl;
  final VoidCallback press;
  final bool? status;
  
  const ProdukWidget({super.key,
    required this.namaProduk,
    required this.ctrl,
    required this.press,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    double defaultPadding = 20;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // kiri
        Row(
          children: [
            CircleAvatar(
              child: Text(namaProduk.substring(0, 1)),
            ),
            SizedBox(width: defaultPadding/2,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Barang #$namaProduk', style: const TextStyle(fontWeight: FontWeight.bold),),
                Text('detail $namaProduk', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),)
              ],
            )
          ],
        ),
        // kanan
        Row(
          children: [
            Container(
              width: 50,
              child: TextField(
                controller: ctrl,
              ),
            ),
            SizedBox(width: defaultPadding/2,),
            Center(
              child: IconButton(
                onPressed: status! ? null : press,
                icon: status! ? const Icon(Icons.check, color: Colors.green,) : const Icon(Icons.add_shopping_cart_outlined),
              ),
            )
          ],
        )
      ],
    );
  }
}