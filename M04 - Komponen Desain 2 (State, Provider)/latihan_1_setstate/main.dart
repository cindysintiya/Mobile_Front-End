import 'package:flutter/material.dart';
import 'package:latihan_1_setstate/todos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '211110347 - Cindy Sintiya',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: '211110347 - Cindy Sintiya'),
      debugShowCheckedModeBanner: false,    // supaya tulisan debug di kanan atas ilang
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> allTodos = [];
  TextEditingController kegiatan = TextEditingController();
  TextEditingController keterangan = TextEditingController();
  TextEditingController mulai = TextEditingController();
  TextEditingController selesai = TextEditingController();
  String kategori = 'Routine';

  @override
  void initState() {
    // inisialisasi nilai awal/ pertama kali run utk stiap input
    kegiatan.text = 'Judul Kegiatan';
    keterangan.text = 'Tambah Keterangan';
    // mulai.text = DateTime.now().toString().split(' ')[0];  // klo format otomatis dd-mm-yyyy
    // selesai.text = DateTime.now().toString().split(' ')[0];  // klo format otomatis dd-mm-yyyy
    mulai.text = DateTime.now().toString().split(' ')[0].split('-').reversed.join('-');  // utk format yyyy-mm-dd
    selesai.text = DateTime.now().toString().split(' ')[0].split('-').reversed.join('-');
    kategori = 'Routine';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Column(
            mainAxisAlignment: allTodos.isEmpty? MainAxisAlignment.center : MainAxisAlignment.start,
            children: allTodos.isEmpty? [
              Text('It`s empty here', style: Theme.of(context).textTheme.headlineMedium,),
              Image.network('https://t3.ftcdn.net/jpg/04/59/40/12/360_F_459401247_gbWn6xuQmiDv11uFYFZPwaQQOE6vA1dc.jpg', width: 350,),
              const Text('Hit the + button to add a new task', style: TextStyle(fontSize: 18))
            ] : allTodos.map((val) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Text('${allTodos.indexOf(val)+1}'),
                    ),
                    const SizedBox(width: 15,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${val['kegiatan']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                          Text('${val['keterangan']}', style: const TextStyle(color: Colors.grey, fontSize: 16),),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.all(Radius.circular(8))
                            ),
                            child: Text('${val['kategori']}', style: const TextStyle(color: Colors.white),),
                          ),
                          Text('${val['tglMulai']} s/d'),
                          Text('${val['tglSelesai']}'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TodosScreen(kegiatanCtrl: kegiatan, keteranganCtrl: keterangan, mulaiCtrl: mulai, selesaiCtrl: selesai, dropVal: kategori, changeDropVal: (selectedVal) {kategori = selectedVal.toString();}, press: () {
            setState(() {
              allTodos.add({'kegiatan':kegiatan.text, 'keterangan':keterangan.text, 'tglMulai':mulai.text, 'tglSelesai':selesai.text, 'kategori':kategori});
              // membersihkan isi input/ mengembalikan ke default value
              kegiatan.text = '';
              keterangan.text = '';
              mulai.text = DateTime.now().toString().split(' ')[0].split('-').reversed.join('-');
              selesai.text = DateTime.now().toString().split(' ')[0].split('-').reversed.join('-');
              kategori = 'Routine';
              // print(allTodos);
            });
            Navigator.pop(context);
          },)));
        },
        tooltip: 'Add Todos',
        child: const Icon(Icons.add),
      ),
    );
  }
}
