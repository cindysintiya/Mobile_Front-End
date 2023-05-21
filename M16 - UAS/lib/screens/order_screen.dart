import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b_kreazi/providers/order_provider.dart';
import 'package:b_kreazi/providers/burger_provider.dart';
import 'package:b_kreazi/providers/navigation_provider.dart';
import 'package:b_kreazi/providers/notification_provider.dart';
import 'package:b_kreazi/components/stack_burger.dart';
import 'package:b_kreazi/components/custom_color.dart';
import 'package:b_kreazi/pages/create_burger.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key, required this.title});

  final String title;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final provOrder = Provider.of<OrderProvider>(context);
    final provBurger = Provider.of<BurgerProvider>(context);
    final provNav = Provider.of<NavigationProvider>(context);
    final provNotif = Provider.of<NotificationProvider>(context);

    return provOrder.myOrder.isNotEmpty? ListView(
      children: provOrder.myOrder.map((order) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            color: myCustomLighterColor(),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context, 
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Tandai Sudah di Pick-Up', style: TextStyle(fontWeight: FontWeight.bold),),
                      content: const Text('Apakah Anda yakin sudah mengambil pesanan Anda? Dengan ini, Anda tidak dapat melakukan komplain jika pesanan Anda salah atau belum diterima.', textAlign: TextAlign.justify,),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          }, 
                          child: const Text('Batal', style: TextStyle(color: Colors.black45),)
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                            await Future.delayed(
                              const Duration(seconds: 5),
                              () {
                                provNotif.autoSend = {
                                  'title': 'Selamat makan Kreazier', 
                                  'body': 'Hei, ${order['Contact']['Nama']}. Pesanan Burger-mu sudah kamu pick-up. Terima kasih udah menggunakan aplikasi B_Kreazi untuk memesan Burgermu. Selamat menikmati ~~',
                                  'date': DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now()), 
                                  'type': 'Order', 
                                  'read': false
                                };
                              }
                            );
                          }, 
                          child: const Text('Sudah di Pick-Up')
                        )
                      ],
                    );
                  }
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: myCustomColor()[100]
                    ),
                    // padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(bottom: 8),
                    width: MediaQuery.of(context).size.width*0.98,
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(order['Contact']['Waktu'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        ),
                        PopupMenuButton(
                          itemBuilder: (BuildContext menuContext) {
                            return <PopupMenuEntry> [
                              PopupMenuItem(
                                onTap: () async {
                                  await Future.delayed(  // krn hrs nutup popupmenu dulu, br show alert
                                    Duration.zero,
                                    () {
                                      showDialog(
                                        context: context, 
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Tandai Sudah di Pick-Up', style: TextStyle(fontWeight: FontWeight.bold),),
                                            content: const Text('Apakah Anda yakin sudah mengambil pesanan Anda? Dengan ini, Anda tidak dapat melakukan komplain jika pesanan Anda salah atau belum diterima.', textAlign: TextAlign.justify,),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                }, 
                                                child: const Text('Batal', style: TextStyle(color: Colors.black45),)
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                  await Future.delayed(
                                                    const Duration(seconds: 5),
                                                    () {
                                                      provNotif.autoSend = {
                                                        'title': 'Selamat makan Kreazier', 
                                                        'body': 'Hei, ${order['Contact']['Nama']}. Pesanan Burger-mu sudah kamu pick-up. Terima kasih udah menggunakan aplikasi B_Kreazi untuk memesan Burgermu. Selamat menikmati ~~',
                                                        'date': DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now()), 
                                                        'type': 'Order', 
                                                        'read': false
                                                      };
                                                    }
                                                  );
                                                }, 
                                                child: const Text('Sudah di Pick-Up')
                                              )
                                            ],
                                          );
                                        }
                                      );
                                    }
                                  );
                                },
                                child: const Text('Sudah di Pick-Up')
                              ),
                              const PopupMenuDivider(),
                              PopupMenuItem(
                                onTap: () async {
                                  await Future.delayed(  // krn hrs nutup popupmenu dulu, br show alert
                                    Duration.zero,
                                    () {
                                      provBurger.resetAll();
                                      provBurger.orderCreation = order;
                                      provNav.orderState = 'Addition';
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateBurger(back: false)));
                                    }
                                  );
                                },
                                child: const Text('Pesan Ulang')
                              ),
                            ];
                          }
                        )
                      ],
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*0.25, child: StackBurger(source: order, padding: 10,)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.55,
                        child: Table(
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          columnWidths: const {
                            0: IntrinsicColumnWidth(),
                            1: IntrinsicColumnWidth(),
                          },
                          children: [
                            TableRow(
                              children: [
                                const Text('Nama Pemesan'),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                                  child: Text(':'),
                                ),
                                Text(order['Contact']['Nama'], style: const TextStyle(fontSize: 16),)
                              ]
                            ),
                            TableRow(
                              children: [
                                const Text('Nama Burger'),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                                  child: Text(':'),
                                ),
                                Text(order['Name'], style: const TextStyle(fontSize: 16),)
                              ]
                            ),
                            TableRow(
                              children: [
                                const Text('Waktu Pick-Up'),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                                  child: Text(':'),
                                ),
                                Text(order['Contact']['Pick Up'], style: const TextStyle(fontSize: 16),)
                              ]
                            ),
                            TableRow(
                              children: [
                                const Text('Metode Bayar'),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                                  child: Text(':'),
                                ),
                                Text(order['Contact']['Pembayaran'], style: const TextStyle(fontSize: 16),)
                              ]
                            ),
                            TableRow(
                              children: [
                                const Text('Total Harga'),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                                  child: Text(':'),
                                ),
                                Text('${NumberFormat.currency(locale: "id_ID", symbol: "Rp. ", decimalDigits: 0).format(order["FinalPrice"])},-', style: const TextStyle(fontSize: 16),)
                              ]
                            ),
                          ],
                        )
                      )
                    ],
                  ),
                  const SizedBox(height: 8,)
                ],
              ),
            ),
          ),
        );
      }).toList()
    ) : 
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/no-order.png', width: 200,),
          const SizedBox(height: 15,),
          const Text('Belum ada pesanan.\n Yuk buat pesanan pertamamu sekarang!', textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
        ],
      ),
    );
  }
}