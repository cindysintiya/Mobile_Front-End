import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:latihan/provider.dart';

class MyWishlist extends StatefulWidget {
  const MyWishlist({super.key});

  @override
  State<MyWishlist> createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LatihanProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite Destinations'),
      ),
      body:  provider.wishlist.isEmpty? const Center(child: Text('Your Wishlist is Empty', style: TextStyle(fontSize: 20, color: Color(0xFFBB00FF)),),) :
        ListView(
          children: [
            for (var item in provider.wishlist)
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Image.asset('assets/$item', width: MediaQuery.of(context).size.width,),
              ),
            const Padding(padding: EdgeInsets.only(bottom: 8))
          ],
        ),
    );
  }
}