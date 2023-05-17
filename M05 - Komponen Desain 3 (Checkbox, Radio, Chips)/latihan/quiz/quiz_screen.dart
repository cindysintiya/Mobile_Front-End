import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:latihan/quiz/quiz_provider.dart';
import 'package:latihan/quiz/peminatan_provider.dart';

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
  bool kelasSiang= false;

  @override
  Widget build(BuildContext context) {
    // shortcut variable utk provider QuizProvider
    final prov = Provider.of<QuizProvider>(context);
    // shortcut variable utk provider QuizProvider
    final prov2 = Provider.of<PeminatanProvider>(context);

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
              const Text('1. Memori yang berfungsi untuk tempat penyimpanan data sementara disebut..'),
              Row(
                children: [
                  const Text('a.'),
                  const SizedBox(width: 5,),
                  Checkbox(
                    value: soal1a, 
                    onChanged: (val) {
                      setState(() {
                        soal1a = val;                        
                      });
                    },
                  ),
                  const Text('RAM'),
                ],
              ),
              Row(
                children: [
                  const Text('b.'),
                  const SizedBox(width: 5,),
                  Checkbox(
                    value: soal1b, 
                    onChanged: (val) {
                      setState(() {
                        soal1b = val;
                      });
                    }
                  ),
                  const Text('Random Access Memory'),
                ],
              ),
              // respon jawaban soal 1
              if (soal1a == false && soal1b == false)
                Container()
              else if (soal1a == true && soal1b == true)
                const Text('Benar!', style: TextStyle(color: Colors.green),)
              else
                const Text('Jawaban masih salah, coba lagi', style: TextStyle(color: Colors.red),),

              const Divider(),

              // soal 2 : pake RadioButton
              const Text('2. Skema desain pembangunan jaringan disebut..'),
              Row(
                children: [
                  const Text('a.'),
                  const SizedBox(width: 5,),
                  Radio(
                    value: 'topologi', 
                    groupValue: soal2,
                    onChanged: (val) {
                      setState(() {
                        soal2 = 'topologi';
                      });
                    }
                  ),
                  const Text('Topologi'),
                ],
              ),
              Row(
                children: [
                  const Text('b.'),
                  const SizedBox(width: 5,),
                  Radio(
                    value: 'desain jaringan', 
                    groupValue: soal2,
                    onChanged: (val) {
                      setState(() {
                        soal2 = 'desain jaringan';
                      });
                    }
                  ),
                  const Text('Desain Jaringan'),
                ],
              ),
              // respon jawaban soal 2
              if (soal2 == 'answ')              
                Container()
              else if (soal2 == 'topologi')
                const Text('Benar!', style: TextStyle(color: Colors.green),)
              else 
                const Text('Jawaban masih salah, coba lagi', style: TextStyle(color: Colors.red),),

              const Divider(),

              // chips pilih kelas : ChoiceChip
              const Text('Feedback Soal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              const SizedBox(height: 5,),
              const Text('Kelas'),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Row(
                  children: [
                    ChoiceChip(
                      label: const Text('Pagi'), 
                      selected: kelasPagi,
                      selectedColor: Colors.lightBlue,
                      onSelected: (val) {
                        setState(() {
                          kelasPagi = val;
                          kelasSiang = !val;
                        });
                      },
                    ),
                    const SizedBox(width: 5,),
                    ChoiceChip(
                      label: const Text('Siang'), 
                      selected: kelasSiang,
                      selectedColor: Colors.lightBlue,
                      onSelected: (val) {
                        setState(() {
                          kelasPagi = !val;
                          kelasSiang = val;
                        });
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
                        prov.setSekolah = val;
                      },
                    ),
                    const SizedBox(width: 5,),
                    FilterChip(
                      label: const Text('Praktikum'),
                      selected: prov.statusPraktik,
                      selectedColor: Colors.lightBlue,
                      onSelected: (val) {
                        prov.setPraktik = val;
                      },
                    ),
                    const SizedBox(width: 5,),
                    FilterChip(
                      label: const Text('Kursus'),
                      selected: prov.statusKursus,
                      selectedColor: Colors.lightBlue,
                      onSelected: (val) {
                        prov.setKursus = val;
                      },
                    ),
                  ],
                ),
              ),

              // input chip utk latihan
              const Text('Peminatan saat sekolah..'),
              Padding(
                padding: const EdgeInsets.only(top: 2.5, bottom: 2.5),
                child: Row(
                  children: 
                    // Container()
                    // chip terpilih disini, atur dgn state/ provider
                    prov2.terpilih.map((val) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        margin: const EdgeInsets.only(right: 5),
                        child: Text('$val', style: const TextStyle(color: Colors.white),),
                      );
                    }).toList(),
                ),
              ),
              Row(
                children: [
                  InputChip(
                    label: const Text('TKJ'),
                    selected: prov2.statusTKJ,
                    selectedColor: Colors.lightBlue,
                    onSelected: (val) {
                      // atur state
                      prov2.setTKJ = val;
                      prov2.pilihan = 'TKJ';
                    },
                  ),
                  const SizedBox(width: 5,),
                  InputChip(
                    label: const Text('RPL'),
                    selected: prov2.statusRPL,
                    selectedColor: Colors.lightBlue,
                    onSelected: (val) {
                      // atur state
                      prov2.setRPL = val;
                      prov2.pilihan = 'RPL';
                    },
                  ),
                  const SizedBox(width: 5,),
                  InputChip(
                    label: const Text('SMA'),
                    selected: prov2.statusSMA,
                    selectedColor: Colors.lightBlue,
                    onSelected: (val) {
                      // atur state
                      prov2.setSMA = val;
                      prov2.pilihan = 'SMA';
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}