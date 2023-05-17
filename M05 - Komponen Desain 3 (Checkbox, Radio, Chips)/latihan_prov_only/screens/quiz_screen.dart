import 'package:flutter/material.dart';
import 'package:latihan/providers/kelas_provider.dart';
import 'package:latihan/providers/peminatan_provider.dart';
import 'package:latihan/providers/soal1_provider.dart';
import 'package:latihan/providers/soal2_provider.dart';
import 'package:provider/provider.dart';
import 'package:latihan/providers/quiz_provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // status soal 1
  bool? soal1a = false;
  bool? soal1b = false;

  // status soal 2
  String soal2 = 'answ';

  // status pilih kelas
  bool kelasPagi = false;
  bool kelasSiang = false;

  @override
  Widget build(BuildContext context) {
    // shortcut variable utk provider QuizProvider
    final prov = Provider.of<QuizProvider>(context);
    final provMinat = Provider.of<PeminatanProvider>(context);
    final provKelas = Provider.of<KelasProvider>(context);
    final provSoal2 = Provider.of<Soal2Provider>(context);
    final provSoal1 = Provider.of<Soal1Provider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('211110347 - Cindy Sintiya'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // soal 1 : pake CheckBox
              const Text(
                  '1. Memori yang berfungsi untuk tempat penyimpanan data sementara disebut..'),
              Row(
                children: [
                  const Text('a.'),
                  const SizedBox(
                    width: 5,
                  ),
                  Checkbox(
                    value: provSoal1.soal1a,
                    onChanged: (val) {
                      provSoal1.soal1a = val;
                    },
                  ),
                  const Text('RAM'),
                ],
              ),
              Row(
                children: [
                  const Text('b.'),
                  const SizedBox(
                    width: 5,
                  ),
                  Checkbox(
                      value: provSoal1.soal1b,
                      onChanged: (val) {
                        provSoal1.soal1b = val;
                      }),
                  const Text('Random Access Memory'),
                ],
              ),
              // respon jawaban soal 1
              if (provSoal1.soal1a == false && provSoal1.soal1b == false)
                Container()
              else if (provSoal1.soal1a == true && provSoal1.soal1b == true)
                const Text(
                  'Benar!',
                  style: TextStyle(color: Colors.green),
                )
              else
                const Text(
                  'Jawaban masih salah, coba lagi',
                  style: TextStyle(color: Colors.red),
                ),

              const Divider(),

              // soal 2 : pake RadioButton
              const Text('2. Skema desain pembangunan jaringan disebut..'),
              Row(
                children: [
                  const Text('a.'),
                  const SizedBox(
                    width: 5,
                  ),
                  Radio(
                      value: 'topologi',
                      groupValue: provSoal2.soal2,
                      onChanged: (val) {
                        provSoal2.soal2 = 'topologi';
                      }),
                  const Text('Topologi'),
                ],
              ),
              Row(
                children: [
                  const Text('b.'),
                  const SizedBox(
                    width: 5,
                  ),
                  Radio(
                      value: 'desain jaringan',
                      groupValue: provSoal2.soal2,
                      onChanged: (val) {
                        provSoal2.soal2 = 'desain jaringan';
                      }),
                  const Text('Desain Jaringan'),
                ],
              ),
              // respon jawaban soal 2
              if (provSoal2.soal2 == 'answ')
                Container()
              else if (provSoal2.soal2 == 'topologi')
                const Text(
                  'Benar!',
                  style: TextStyle(color: Colors.green),
                )
              else
                const Text(
                  'Jawaban masih salah, coba lagi',
                  style: TextStyle(color: Colors.red),
                ),

              const Divider(),

              // chips pilih kelas : ChoiceChip
              const Text(
                'Feedback Soal',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('Kelas'),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Row(
                  children: [
                    ChoiceChip(
                      label: const Text('Pagi'),
                      avatar: const Icon(
                        Icons.wb_sunny_outlined,
                        size: 18,
                      ),
                      selected: provKelas.kelasPagi,
                      selectedColor: Colors.lightBlue,
                      onSelected: (val) {
                        provKelas.pagi = val;
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ChoiceChip(
                      label: const Text('Siang'),
                      avatar: const Icon(
                        Icons.sunny_snowing,
                        size: 18,
                      ),
                      selected: provKelas.kelasSiang,
                      selectedColor: Colors.lightBlue,
                      onSelected: (val) {
                        provKelas.siang = val;
                      },
                    )
                  ],
                ),
              ),

              const Text('Soal diatas telah dipelajari saat...'),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Row(
                  children: [
                    FilterChip(
                      label: const Text('Sekolah'),
                      selected: prov.statusSekolah,
                      selectedColor: Colors.lightBlue,
                      onSelected: (val) {
                        prov.statusSekolah = val;
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    FilterChip(
                      label: const Text('Praktikum'),
                      selected: prov.statusPraktik,
                      selectedColor: Colors.lightBlue,
                      onSelected: (val) {
                        prov.statusPraktik = val;
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    FilterChip(
                      label: const Text('Kursus'),
                      selected: prov.statusKursus,
                      selectedColor: Colors.lightBlue,
                      onSelected: (val) {
                        prov.statusKursus = val;
                      },
                    ),
                  ],
                ),
              ),

              // InputChip : peminatan
              const Text('Peminatan saat sekolah..'),
              Row(
                  children: provMinat.terpilih
                      .map((val) => Container(
                            decoration: const BoxDecoration(
                                color: Colors.purple,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            margin: const EdgeInsets.only(right: 5),
                            child: Text(
                              '$val',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ))
                      .toList()),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  InputChip(
                    label: const Text('TKJ'),
                    selected: provMinat.statusTKJ,
                    selectedColor: Colors.lightBlue,
                    onSelected: (val) {
                      print(val);
                      provMinat.statusTKJ = val;
                      provMinat.pilihan = 'TKJ';
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InputChip(
                    label: const Text('RPL'),
                    selected: provMinat.statusRPL,
                    selectedColor: Colors.lightBlue,
                    onSelected: (val) {
                      print(val);
                      provMinat.statusRPL = val;
                      provMinat.pilihan = 'RPL';
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InputChip(
                    label: const Text('SMA'),
                    selected: provMinat.statusSMA,
                    selectedColor: Colors.lightBlue,
                    onSelected: (val) {
                      print(val);
                      provMinat.statusSMA = val;
                      provMinat.pilihan = 'SMA';
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
