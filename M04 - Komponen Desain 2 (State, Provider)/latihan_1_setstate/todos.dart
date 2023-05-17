import 'package:flutter/material.dart';

class TodosScreen extends StatefulWidget {
  TextEditingController kegiatanCtrl;
  TextEditingController keteranganCtrl;
  TextEditingController mulaiCtrl;
  TextEditingController selesaiCtrl;
  String dropVal;
  final void Function(String? selectedVal)? changeDropVal;  // function yg bs terima parameter??
  final VoidCallback press;

  TodosScreen({super.key, 
    required this.kegiatanCtrl,
    required this.keteranganCtrl,
    required this.mulaiCtrl,
    required this.selesaiCtrl,
    required this.dropVal,
    required this.changeDropVal, 
    required this.press,
  });

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {

  List<Map<String, String>> allTodos = [];

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
              children: [
                const Icon(Icons.list_alt_rounded),
                const Padding(padding: EdgeInsets.only(right: 5)),
                const Text('Kegiatan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                const Padding(padding: EdgeInsets.only(right: 30)),
                Flexible(
                  child: TextField(
                    controller: widget.kegiatanCtrl,
                    decoration: const InputDecoration(
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
              children: [
                const Padding(padding: EdgeInsets.only(left: 30)),
                Flexible(
                  child: TextField(
                    controller: widget.keteranganCtrl,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      // contentPadding: EdgeInsets.fromLTRB(20, 40, 20, 40),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Tambah Keterangan',
                      hintStyle: TextStyle(fontSize: 15)
                    ),
                    maxLines: 3,
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
                    controller: widget.mulaiCtrl,
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
                    controller: widget.selesaiCtrl,
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
            const SizedBox(height: 10,),
            Row(
              children: [
                const Icon(Icons.category_rounded),
                const Padding(padding: EdgeInsets.only(right: 5)),
                const Text('Kategori', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                const Padding(padding: EdgeInsets.only(right: 100)),
                Flexible(
                  child: DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(value: 'Routine', child: Text('Routine'),),
                      DropdownMenuItem(value: 'Study', child: Text('Study'),),
                      DropdownMenuItem(value: 'Work', child: Text('Work'),),
                      DropdownMenuItem(value: 'Eat', child: Text('Eat'),),
                    ],
                    value: widget.dropVal,
                    onChanged: widget.changeDropVal,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    focusColor: Colors.white,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  )
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
                    onPressed: widget.press,
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