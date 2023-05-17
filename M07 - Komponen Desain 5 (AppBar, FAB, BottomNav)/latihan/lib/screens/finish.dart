import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:latihan/providers/mygame_provider.dart';

class FinishScreen extends StatefulWidget {
  const FinishScreen({super.key});

  @override
  State<FinishScreen> createState() => _FinishScreenState();
}

class _FinishScreenState extends State<FinishScreen> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyGameProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finish'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const Text('Skor Anda :', style: TextStyle(fontSize: 20),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(prov.board.firstWhere((player) => player['name']=='YOU')['score'].toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
                ),
                const Text('Papan Skor:', style: TextStyle(fontSize: 20),),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  // width: MediaQuery.of(context).size.width/2.5,
                  width: 280,
                  child: Table(
                    // columnWidths: const {
                    //   0 : FlexColumnWidth(0.1),
                    //   1 : FlexColumnWidth(0.12),
                    //   2 : FlexColumnWidth(0.1)
                    // },
                    children: [
                      const TableRow(
                        children: [
                          Center(child: Text('Rank', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                          Center(child: Text('Nama', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                          Center(child: Text('Skor', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                        ]
                      ),
                      for (var player in prov.board.sublist(0, 5))
                        TableRow(
                          children: [
                            Center(child: Text((prov.board.indexOf(player)+1).toString(), style: const TextStyle(fontSize: 17),)),
                            Center(child: Text(player['name'], style: const TextStyle(fontSize: 17),)),
                            Center(child: Text(player['score'].toString(), style: const TextStyle(fontSize: 17),)),
                          ]
                        ),
                    ],
                  ),
                ),
                prov.board.indexOf(prov.board.firstWhere((player) => player['name']=='YOU')) == 5 ? 
                const Text('Sayang sekali, kamu belum bisa masuk 5 besar.', style: TextStyle(fontSize: 17),) : 
                const Text('Hebat, kamu berhasil mengalahkan player lain dan masuk 5 besar.', style: TextStyle(fontSize: 17),),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context), 
                    child: const Padding(
                      padding: EdgeInsets.all(2.5),
                      child: Text('Main Lagi', style: TextStyle(fontSize: 18),),
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}