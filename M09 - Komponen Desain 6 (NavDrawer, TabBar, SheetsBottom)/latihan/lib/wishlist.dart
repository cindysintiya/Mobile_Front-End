import 'package:flutter/material.dart';
import 'package:latihan/login.dart';
import 'package:provider/provider.dart';
import 'package:latihan/provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LatihanProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: provider.userInfo['username'].toLowerCase()=='who?'? 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login untuk melihat orderanmu'),
              const SizedBox(height: 10,),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                }, 
                child: const Text('Login')
              )
            ],
          ),
        )
        :
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hei ${provider.userInfo['username']}, kamu belum memesan apa-apa nih.'),
              const SizedBox(height: 10,),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                }, 
                child: const Text('Lihat Rekomendasi')
              )
            ],
          ),
        ),
    );
  }
}