import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b_kreazi/providers/burger_provider.dart';
import 'package:b_kreazi/providers/navigation_provider.dart';
import 'package:b_kreazi/providers/order_provider.dart';
import 'package:b_kreazi/providers/user_provider.dart';
import 'package:b_kreazi/providers/notification_provider.dart';
import 'package:b_kreazi/providers/creation_provider.dart';
import 'package:b_kreazi/providers/officialmenu_provider.dart';
import 'package:b_kreazi/components/custom_color.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key, required this.title});

  final String title;

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    final provBurger = Provider.of<BurgerProvider>(context);
    final provNav = Provider.of<NavigationProvider>(context);
    final provOrder = Provider.of<OrderProvider>(context);
    final provUser = Provider.of<UserProvider>(context);
    final provNotif = Provider.of<NotificationProvider>(context);
    final provCreate = Provider.of<CreationProvider>(context);
    final provMenu = Provider.of<OfficialMenuProvider>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const {
                  0 : IntrinsicColumnWidth()
                },
                children: [
                  TableRow(
                    children: [
                      const Text('Nama'),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 10),
                        child: TextField(
                          controller: provBurger.nama,
                          maxLength: 20,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Pastikan memasukkan nama yang sesuai.',
                            labelText: 'Nama Anda',
                            errorText: provBurger.userInfo.isNotEmpty && provBurger.userInfo['Nama'].toString().isEmpty? 'Nama wajib dimasukkan' : provBurger.nama.text.trim().contains('kreazi')? 'Anda tidak diizinkan memakai nama ini.' : null,
                          ),
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      const Text('No HP'),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 5),
                        child: TextField(
                          controller: provBurger.noHp,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9*#+]'))
                          ],
                          maxLength: 15,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Pastikan memasukkan nomor [WhatsApp] yang aktif.',
                            labelText: 'No HP Anda',
                            errorText: provBurger.userInfo.isNotEmpty && provBurger.userInfo['No HP'].toString().isEmpty? 'No HP wajib dimasukkan' : provBurger.userInfo.isNotEmpty && provBurger.userInfo['No HP'].toString().length<8? 'Invalid. Masukkan minimal 8 karakter' : null,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      const Text('Jenis Kelamin'),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Radio(
                                    value: 'Laki-Laki', 
                                    groupValue: provBurger.gender, 
                                    onChanged: (val) {
                                      provBurger.changeGender = val;
                                    }
                                  ),
                                  const Text('Laki-Laki'),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio(
                                  value: 'Perempuan', 
                                  groupValue: provBurger.gender, 
                                  onChanged: (val) {
                                    provBurger.changeGender = val;
                                  }
                                ),
                                const Text('Perempuan'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      const Text('Metode Pembayaran'),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: DropdownButtonFormField(
                          value: provBurger.selPembayaran,
                          items: [
                            for (var item in provBurger.pembayaran)
                              DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              )
                          ], 
                          onChanged: (val) {provBurger.changePembayaran = val;},
                          icon: const Icon(Icons.keyboard_arrow_down),
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          focusColor: Colors.grey[50],
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.black45)
                            ),
                            errorText: provBurger.userInfo.isNotEmpty && provBurger.selPembayaran == 'Pilih'? 'Wajib pilih metode pembayaran' : null
                          ),
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      const Text('Waktu pengambilan'),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {provBurger.addWaktu='jam';}, 
                                splashRadius: 10,
                                icon: const Icon(Icons.keyboard_arrow_up_rounded)
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(3)
                                ),
                                padding: const EdgeInsets.all(5),
                                child: Text(DateFormat('HH').format(provBurger.waktu))
                              ),
                              IconButton(
                                onPressed: () {provBurger.redWaktu='jam';}, 
                                splashRadius: 10,
                                icon: const Icon(Icons.keyboard_arrow_down_rounded)
                              ),
                            ],
                          ),
                          const Text(':'),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {provBurger.addWaktu='menit';}, 
                                splashRadius: 10,
                                icon: const Icon(Icons.keyboard_arrow_up_rounded)
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(3)
                                ),
                                padding: const EdgeInsets.all(5),
                                child: Text(DateFormat('mm').format(provBurger.waktu))
                              ),
                              IconButton(
                                onPressed: () {provBurger.redWaktu='menit';}, 
                                splashRadius: 10,
                                icon: const Icon(Icons.keyboard_arrow_down_rounded)
                              ),
                            ],
                          ),
                          const SizedBox(width: 10,),
                          IconButton(
                            onPressed: () async {
                              var res = await showTimePicker(
                                context: context, 
                                initialTime: TimeOfDay.fromDateTime(provBurger.waktu),
                                builder: (context, child) {
                                  return MediaQuery(data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true), child: child!);
                                },
                              );
                              if (res != null) {
                                setState(() {
                                  final now = DateTime.now().add(const Duration(minutes: 5));
                                  final tmp = DateTime(now.year, now.month, now.day, res.hour, res.minute);
                                  if (now.difference(tmp).inMinutes <= 0) {
                                    if (tmp.hour>=22) {
                                      provBurger.addPickup = DateTime(now.year, now.month, now.day, 22, 0);
                                    }
                                    else if (tmp.hour<=6) {
                                      provBurger.addPickup = DateTime(now.year, now.month, now.day, 6, 0);
                                    }
                                    else {
                                      provBurger.addPickup = tmp;
                                    }
                                  }
                                  else {
                                    provBurger.addPickup = now;
                                  }
                                });
                              }
                            }, 
                            tooltip: 'Pilih waktumu',
                            splashRadius: 20,
                            icon: const Icon(Icons.timer_rounded)
                          )
                        ],
                      ),
                    ]
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(child: Text('Simpan & Update data kontak saya ke Profile', overflow: TextOverflow.fade,)),
                  Switch(
                    value: provBurger.saveUser, 
                    onChanged: (val) {
                      provBurger.saveUser = val;
                    },
                    activeColor: myCustomColor(),
                    activeTrackColor: myCustomColor()[200],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: OutlinedButton(
                        onPressed: () {provNav.orderState = 'Addition';},
                        child: const Text('Kembali', overflow: TextOverflow.ellipsis,),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Wrap(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      alignment: WrapAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: provCreate.allCreations.any((creation) => creation['Burger'].toString() == provBurger.finalComponent['Burger'].toString()) || provMenu.allMenu.any((menu) => menu['Burger'].toString() == provBurger.finalComponent['Burger'].toString())? null : () {
                            provBurger.addContactInfo();
                            if (provBurger.nama.text.trim().isNotEmpty && provBurger.noHp.text.trim().isNotEmpty && provBurger.userInfo['No HP'].toString().length>=8 && provBurger.selPembayaran!='Pilih') {
                              showDialog(
                                context: context, 
                                builder: (BuildContext context) {
                                  final provBurger = Provider.of<BurgerProvider>(context);
                                  return AlertDialog(
                                    title: const Text('Masukkan nama Kreazi-mu', style: TextStyle(fontWeight: FontWeight.bold),),
                                    content: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          controller: provBurger.creationName,
                                          autofocus: true,
                                          maxLength: 15,
                                          decoration: InputDecoration(
                                            hintText: 'Nama Kreazi-mu disini',
                                            errorText: provBurger.creationName.text.trim().isEmpty? 'Wajib diisi' : provCreate.allCreations.any((creation) => creation['Name'].toLowerCase()==provBurger.creationName.text.trim().toLowerCase())? 'Nama Kreazi ini sudah terdaftar' : provBurger.creationName.text.trim().toLowerCase().contains('kreazi')? 'Tidak boleh memakai nama ini' : null
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        Text('Kamu akan membuat pesanan senilai ${NumberFormat.currency(locale: "id_ID", symbol: "Rp. ", decimalDigits: 0).format(provBurger.myOrder()['FinalPrice'])},- dengan metode pembayaran ${provBurger.selPembayaran} dan Kreazi ini juga akan diposting dihalaman Creation.', textAlign: TextAlign.justify, style: const TextStyle(fontSize: 14),)
                                      ],
                                    ),
                                    actions: [
                                      TextButton(onPressed: () {Navigator.pop(context);}, child: const Text('Batal', style: TextStyle(color: Colors.grey),)),
                                      TextButton(
                                        onPressed: () async {
                                          provBurger.addContactInfo();
                                          if (provBurger.creationName.text.trim().isNotEmpty && !provCreate.allCreations.any((creation) => creation['Name'].toLowerCase()==provBurger.creationName.text.trim().toLowerCase())) {
                                            Navigator.popUntil(context, (route) => route.isFirst);
                                            provNav.orderState = 'Choose';
                                            provCreate.addCreations = provBurger.myCreation();
                                            provCreate.addMyCreation = provBurger.myCreation();
                                            final pesananSaya = provBurger.myOrder();
                                            provOrder.addOrder = pesananSaya;  // add to order
                                            if (provBurger.saveUser) {
                                              provUser.saveUser = {
                                                'Nama' : provBurger.nama.text.trim(),
                                                'No HP' : provBurger.noHp.text.trim(),
                                                'Gender' : provBurger.gender
                                              };
                                            }
                                            else if (provUser.userInfo.isEmpty) {
                                              provBurger.resetContactInfo();
                                            }
                                            else {
                                              provBurger.userInfo = provUser.userInfo;
                                            }

                                            // auto send notif setelah ... menit 
                                            final now = DateTime.now();
                                            final time = DateTime(now.year, now.month, now.day, provBurger.waktu.hour, provBurger.waktu.minute);
                                            await Future.delayed(
                                              time.difference(now),
                                              () {
                                                if (pesananSaya['Order']['Status']!='Sudah di Pick-Up') { // status pesanan belum berubah
                                                  provNotif.autoSend = {
                                                    'title': 'Sudah waktunya Pick-Up', 'body': 'Kriinggg... Masih inget pesanan Burger yang kamu jadwalkan untuk diambil pukul ${DateFormat('HH').format(time)}:${DateFormat('mm').format(time)}? Kamu udah bisa datang ke store untuk cek apakah Burger-mu udah siap dan nikmatilah selagi fresh *chef kiss* (Ini adalah pesan otomatis)',
                                                    'date': DateFormat('dd-MM-yyyy HH:mm').format(time),
                                                    'type': 'Order', 
                                                    'read': false
                                                  }; 
                                                }
                                              }
                                            );
                                          }
                                        }, 
                                        child: const Text('Posting dan Pesan')
                                      )
                                    ],
                                  );
                                }
                              );
                              provNav.currentIndex = 2;   // tampilkan halaman order
                            }
                          },
                          child: Text(provCreate.allCreations.any((creation) => creation['Burger'].toString() == provBurger.finalComponent['Burger'].toString())? 'Kreazi terdaftar' : provMenu.allMenu.any((menu) => menu['Burger'].toString() == provBurger.finalComponent['Burger'].toString())? 'Menu terdaftar' : 'Posting Kreazi')
                        ),
                        const SizedBox(width: 10,),
                        ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.orangeAccent)
                          ),
                          onPressed: () {
                            provBurger.addContactInfo();
                            if (provBurger.nama.text.trim().isNotEmpty && provBurger.noHp.text.trim().isNotEmpty && provBurger.userInfo['No HP'].toString().length>=8 && provBurger.selPembayaran!='Pilih') {
                              showDialog(
                                context: context, 
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Konfirmasi Ulang', style: TextStyle(fontWeight: FontWeight.bold),),
                                    content: Text('Hai, ${provBurger.nama.text.trim()}. Kamu yakin akan membuat pesanan senilai ${NumberFormat.currency(locale: "id_ID", symbol: "Rp. ", decimalDigits: 0).format(provBurger.myOrder()['FinalPrice'])},- dengan metode pembayaran ${provBurger.selPembayaran}?', textAlign: TextAlign.justify,),
                                    actions: [
                                      TextButton(onPressed: () {Navigator.pop(context);}, child: const Text('Batal', style: TextStyle(color: Colors.grey),)),
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.popUntil(context, (route) => route.isFirst); // back/ exit ampe home
                                          provNav.orderState = 'Choose';
                                          final pesananSaya = provBurger.myOrder();
                                          provOrder.addOrder = pesananSaya;  // add to order
                                          if (provBurger.saveUser) { // jika mau disave data
                                            provUser.saveUser = {
                                              'Nama' : provBurger.nama.text.trim(),
                                              'No HP' : provBurger.noHp.text.trim(),
                                              'Gender' : provBurger.gender
                                            };
                                          }
                                          else if (provUser.userInfo.isEmpty) {  // jk tdk di save dan data profile mmg kosong
                                            provBurger.resetContactInfo();
                                          }
                                          else {  // jk tdk di save dan data profile ada
                                            provBurger.userInfo = provUser.userInfo;
                                          }

                                          // auto send notif setelah ... menit 
                                          final now = DateTime.now();
                                          final time = DateTime(now.year, now.month, now.day, provBurger.waktu.hour, provBurger.waktu.minute);
                                          await Future.delayed(
                                            time.difference(now),
                                            () {
                                              if (pesananSaya['Order']['Status'] != 'Sudah di Pick-Up') { // status pesanan belum berubah
                                                provNotif.autoSend = {
                                                  'title': 'Sudah waktunya Pick-Up', 'body': 'Kriinggg... Masih inget pesanan Burger yang kamu jadwalkan untuk diambil pukul ${DateFormat('HH').format(time)}:${DateFormat('mm').format(time)}? Kamu udah bisa datang ke store untuk cek apakah Burger-mu udah siap dan nikmatilah selagi fresh *chef kiss* (Ini adalah pesan otomatis)',
                                                  'date': DateFormat('dd-MM-yyyy HH:mm').format(time), 
                                                  'type': 'Order', 
                                                  'read': false
                                                };
                                              }
                                            }
                                          );
                                        },
                                        child: const Text('Ya')
                                      )
                                    ],
                                  );
                                }
                              );
                            }
                            provNav.currentIndex = 2;   // tampilkan halaman order
                          },
                          child: const Text('Langsung Pesan'),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}