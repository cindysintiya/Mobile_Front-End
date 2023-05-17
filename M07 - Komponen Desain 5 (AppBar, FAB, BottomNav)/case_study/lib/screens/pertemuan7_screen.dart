import 'package:case_study/components/pertemuan7_body.dart';
import 'package:case_study/providers/pertemuan7_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pertemuan7Screen extends StatefulWidget {
  const Pertemuan7Screen({super.key});

  @override
  State<Pertemuan7Screen> createState() => _Pertemuan7ScreenState();
}

class _Pertemuan7ScreenState extends State<Pertemuan7Screen> {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan7Provider>(context);

    final List _body = [
      const Pertemuan7Body(title: 'Beranda'),
      const Pertemuan7Body(title: 'Chat'),
      const Pertemuan7Body(title: 'Profile'),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Pertemuan 7'),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              const Icon(Icons.notifications),
              Positioned(
                top: 10,
                right: 0,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow
                  ),
                  child: Text(prov.ttlNotif.toString(), 
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 12,
                      color: Colors.black
                    ),
                  ),
                )
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: () {
                prov.resetNotif();
              },
              icon: const Icon(Icons.delete),
            ),
          ),
          const Icon(Icons.more_vert)
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: _body[_currentIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          prov.ttlNotif = 1;
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}