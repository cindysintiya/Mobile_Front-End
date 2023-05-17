import 'package:flutter/material.dart';
import 'package:latihan/components/darat.dart';
import 'package:latihan/components/laut.dart';
import 'package:latihan/components/udara.dart';
import 'package:latihan/screens/finish.dart';
import 'package:provider/provider.dart';
import 'package:latihan/providers/mygame_provider.dart';

class HidupDimana extends StatefulWidget {
  const HidupDimana({super.key});

  @override
  State<HidupDimana> createState() => _HidupDimanaState();
}

class _HidupDimanaState extends State<HidupDimana> {
  int _currentIndex = 0;
    
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyGameProvider>(context);

    final List _body = [
      const Darat(title: 'Darat'),
      const Laut(title: 'Laut'),
      const Udara(title: 'Udara'),
    ];

    String hewan = prov.randHewan();

    checkAnsw() {
      if ((_body[_currentIndex].title == 'Darat' && prov.darat.contains(hewan)) || (_body[_currentIndex].title == 'Laut' && prov.laut.contains(hewan)) || (_body[_currentIndex].title == 'Udara' && prov.udara.contains(hewan))) {
        prov.gainPoint = prov.point;
      }
      else {
        prov.minPoint = prov.point;
      }
      if (prov.score < 0) {
        prov.finishGame();
        Navigator.push(context, MaterialPageRoute(builder: (context) => const FinishScreen()));
      }
      prov.randPoint();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_body[_currentIndex].title.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
        // centerTitle: true,
        toolbarHeight: 65,
        leading: IconButton(
          onPressed: () {
            showDialog(
                context: context, 
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Cara Bermain', style: TextStyle(fontWeight: FontWeight.bold),),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var rule in prov.gameRules)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 1.5, right: 5),
                                    child: Icon(Icons.star_rounded, size: 16),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width*0.55, child: Text(rule)),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(onPressed: () {Navigator.pop(context);}, child: const Text('OK, MENGERTI!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),))
                    ],
                  );
                }
              );
          },
          tooltip: 'Game Rules',
          icon: const Icon(Icons.menu_book_rounded)
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Text('Skor Anda :', style: TextStyle(fontSize: 18),),
                  const SizedBox(width: 8,),
                  Text(prov.score.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: prov.tepat? Colors.green : Colors.red, fontSize: 22),),
                ],
              ),
              Row(
                children: [
                  const Text('Next Point :', style: TextStyle(fontSize: 18),),
                  const SizedBox(width: 8,),
                  Text(prov.point.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.05, 0, 10, 0),
            child: IconButton(
              onPressed: () {
                showDialog(
                context: context, 
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Selesaikan Game', style: TextStyle(fontWeight: FontWeight.bold),),
                    content: const Text('Kamu yakin ingin menghentikan permainan? Semua pencapaian kamu saat ini akan di reset ke 0.'),
                    actions: [
                      TextButton(
                        onPressed: () {Navigator.pop(context);}, 
                        child: const Text('Batal', style: TextStyle(fontSize: 18, color: Colors.grey),)
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          prov.finishGame();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const FinishScreen()));
                        }, 
                        child: const Text('Ya', style: TextStyle(fontSize: 18, color: Colors.red),)
                      )
                    ],
                  );
                }
                );
              }, 
              tooltip: 'Finish Game',
              icon: const Icon(Icons.flag_rounded)
            ),
          )
        ],
      ),
      body: _body[_currentIndex],
      floatingActionButton: FloatingActionButton.large(
        onPressed: () => checkAnsw(),
        tooltip: hewan.split('+')[0].toString(),
        child: Text(hewan.split('+')[1].toString(), style: const TextStyle(fontSize: 38, fontFamily: 'EmojiOne'),),
        // tooltip: hewan.substring(0, hewan.length-2).toString(),
        // child: Text(hewan.substring(hewan.length-1).toString(), style: const TextStyle(fontSize: 38, fontFamily: 'EmojiOne'),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          checkAnsw();
        },
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grass), label: 'Darat'),
          BottomNavigationBarItem(icon: Icon(Icons.water), label: 'Laut'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Udara'),
        ],
      ),
    );
  }
}