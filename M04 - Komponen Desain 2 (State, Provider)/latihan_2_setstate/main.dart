import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Segitiga',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '211110347 - Cindy Sintiya'),
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
  final TextEditingController sisi1 = TextEditingController();
  final TextEditingController sisi2 = TextEditingController();
  final TextEditingController sisi3 = TextEditingController();
  int keliling = 0;
  String status = 'Hitung';

  @override
  Widget build(BuildContext context) {
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
                            controller: sisi1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: '0',
                              errorText: sisi1.text!=sisi2.text && sisi2.text==sisi3.text? 'harus sama' : null
                            ),
                          ),
                        ),
                        const SizedBox(width: 25,),
                        Flexible(
                          child: TextField(
                            controller: sisi2,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: '0',
                              errorText: sisi2.text!=sisi1.text && sisi1.text==sisi3.text? 'harus sama' : null
                            ),
                          ),
                        ),
                        const SizedBox(width: 25,),
                        Flexible(
                          child: TextField(
                            controller: sisi3,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: '0',
                              errorText: sisi3.text!=sisi1.text && sisi1.text==sisi2.text? 'harus sama' : null
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
                              setState(() {
                                keliling = 0;
                                if (sisi1.text.isNotEmpty && sisi2.text.isNotEmpty && sisi3.text.isNotEmpty) {
                                  if (sisi1.text == sisi2.text && sisi2.text == sisi3.text) {
                                    keliling = int.parse(sisi1.text) + int.parse(sisi2.text) + int.parse(sisi3.text);
                                    status = 'Hitung';
                                    sisi1.text = '';
                                    sisi2.text = '';
                                    sisi3.text = '';
                                  }
                                  else {
                                    status = 'Coba Lagi'; 
                                  }
                                }
                                else {
                                  status = 'Tidak boleh ada Field Kosong';
                                }
                              });
                            },
                            child: Text(status, style: const TextStyle(fontSize: 16)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Text(keliling==0 ? '' : 'Hasil : $keliling cm', style: const TextStyle(color: Colors.green),),
                    const SizedBox(height: 10,),
                    Stack(
                      children: keliling==0? [] : [
                        Center(
                          child: Image.asset('Segitiga-Sama-Sisi.png',),
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.only(top: 70),
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(keliling==0 ? '' : '${keliling/3} cm', style: const TextStyle(color: Colors.green),),
                                Text(keliling==0 ? '' : '${keliling/3} cm', style: const TextStyle(color: Colors.green),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(keliling==0 ? '' : '${keliling/3} cm', style: const TextStyle(color: Colors.green),),
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
