import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(    // wajib ditambah di setiap parent yg akan pake provider
      create: (context) => SisiProvider(),  // utk single provider
      child: MaterialApp(
        title: 'Kalkulator Segitiga',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: '211110347 - Cindy Sintiya',),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class SisiProvider extends ChangeNotifier {
  TextEditingController sisi1 = TextEditingController();
  TextEditingController sisi2 = TextEditingController();
  TextEditingController sisi3 = TextEditingController();

  // perhitungan keliling (pengganti setState)
  int _keliling = 0;
  int get keliling => _keliling;
  set hitung(val) {
    _keliling = int.parse(val) * 3;
    sisi1.text = '';
    sisi2.text = '';
    sisi3.text = '';
    _status = 'Hitung';
    notifyListeners();
  }

  // perubahan status button (pengganti setState)
  String _status = 'Hitung';
  String get status => _status;
  set changeStatus(val) {
    _status = val;
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final providerRead = context.read<SisiProvider>();    // 
    final providerWatch = context.watch<SisiProvider>();  // 
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Hitung Keliling Segitiga Sama Sisi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide()),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Masukkan ke-3 sisinya'),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: TextField(
                            controller: providerWatch.sisi1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: '0',
                              errorText: providerRead.status=='Tidak boleh ada Field Kosong' && providerRead.sisi1.text.isEmpty ? 'harus isi' : (providerRead.sisi1.text!=providerRead.sisi2.text && providerRead.sisi2.text==providerRead.sisi3.text && providerRead.sisi2.text.isNotEmpty? 'harus sama' : null)
                            ),
                          ),
                        ),
                        const SizedBox(width: 25,),
                        Flexible(
                          child: TextField(
                            controller: providerWatch.sisi2,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: '0',
                              errorText: providerRead.status=='Tidak boleh ada Field Kosong' && providerRead.sisi2.text.isEmpty ? 'harus isi' : (providerRead.sisi2.text!=providerRead.sisi1.text && providerRead.sisi1.text==providerRead.sisi3.text && providerRead.sisi1.text.isNotEmpty? 'harus sama' : null)
                            ),
                          ),
                        ),
                        const SizedBox(width: 25,),
                        Flexible(
                          child: TextField(
                            controller: providerWatch.sisi3,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: '0',
                              errorText: providerRead.status=='Tidak boleh ada Field Kosong' && providerRead.sisi3.text.isEmpty ? 'harus isi' : (providerRead.sisi3.text!=providerRead.sisi1.text && providerRead.sisi1.text==providerRead.sisi2.text && providerRead.sisi1.text.isNotEmpty? 'harus sama' : null)
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                                if (providerRead.sisi1.text.isNotEmpty && providerRead.sisi2.text.isNotEmpty && providerRead.sisi3.text.isNotEmpty) {
                                  if (providerRead.sisi1.text == providerRead.sisi2.text && providerRead.sisi2.text == providerRead.sisi3.text) {
                                    providerWatch.hitung = providerWatch.sisi1.text;
                                  }
                                  else {
                                    providerWatch.changeStatus = 'Coba Lagi'; 
                                  }
                                }
                                else {
                                  providerWatch.changeStatus = 'Tidak boleh ada Field Kosong';
                                }
                            },
                            child: Text(providerRead.status, style: const TextStyle(fontSize: 16)),
                          ),
                        )
                      ],
                    ),
                    providerRead.keliling==0 || providerRead.status!='Hitung' ? const SizedBox() : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        Text('Hasil : ${providerRead.keliling} cm', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16),),
                        const SizedBox(height: 10,),
                        Stack(
                          children: [
                            Center(child: Image.asset('Segitiga-Sama-Sisi.png',),),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.only(top: 70),
                                width: 300,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(providerRead.keliling==0 ? '' : '${providerRead.keliling/3} cm', style: const TextStyle(color: Colors.green),),
                                    Text(providerRead.keliling==0 ? '' : '${providerRead.keliling/3} cm', style: const TextStyle(color: Colors.green),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text('${providerRead.keliling/3} cm', style: const TextStyle(color: Colors.green),),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
