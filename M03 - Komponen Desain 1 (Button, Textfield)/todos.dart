import 'package:flutter/material.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(children: [
            Row(
              children: const [
                Icon(Icons.list_alt_rounded),
                Padding(padding: EdgeInsets.only(right: 5)),
                Text('Kegiatan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                Padding(padding: EdgeInsets.only(right: 30)),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      contentPadding: EdgeInsets.all(20),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Judul Kegiatan',
                      hintStyle: TextStyle(fontSize: 15)
                    ),
                    autofocus: true,
                  ),
                )
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              children: const [
                Icon(Icons.sort_rounded),
                Padding(padding: EdgeInsets.only(right: 5)),
                Text('Keterangan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              ],
            ),
            const SizedBox(height:8,),
            Row(
              children: const [
                Padding(padding: EdgeInsets.only(left: 30)),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20, 40, 20, 40),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Tambah Keterangan',
                      hintStyle: TextStyle(fontSize: 15)
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                Expanded(   // mengambil sisa space yang ada
                  child: Row(
                    children: const [
                      Icon(Icons.date_range_rounded),
                      Padding(padding: EdgeInsets.only(right: 5)),
                      Text('Tanggal Mulai', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
                    ],
                  ),
                ),
                Expanded(   // mengambil sisa space yang ada
                  child: Row(
                    children: const [
                      Icon(Icons.date_range_outlined),
                      Padding(padding: EdgeInsets.only(right: 5)),
                      Text('Tanggal Selesai', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 30)),
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      contentPadding: EdgeInsets.all(15),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '20-03-2022',
                      hintStyle: TextStyle(fontSize: 14)
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 30)),
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      contentPadding: EdgeInsets.all(15),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '20-03-2022',
                      hintStyle: TextStyle(fontSize: 14)
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Flexible(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45),
                    ),
                    child: const Text('Batal', style: TextStyle(fontSize: 16),),
                  ),
                ),
                const SizedBox(width: 10,),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45)
                    ),
                    child: const Text('Simpan', style: TextStyle(fontSize: 16),),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}