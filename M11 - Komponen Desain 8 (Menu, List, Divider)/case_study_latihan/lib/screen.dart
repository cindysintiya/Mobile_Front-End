import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:case_study_latihan/provider.dart';

class Pertemuan11Screen extends StatefulWidget {
  const Pertemuan11Screen({super.key});

  @override
  State<Pertemuan11Screen> createState() => _Pertemuan11ScreenState();
}

class _Pertemuan11ScreenState extends State<Pertemuan11Screen> {
  body(BuildContext context) {
    final provider = Provider.of<Pertemuan11Provider>(context);
    if (provider.data == null) {   // menghindari data null
      return const Center(child: CircularProgressIndicator());
    }
    else if (provider.data.isEmpty) {
      return const Center(
        child: Text('Data tidak ditemukan'),
      );
    }
    else {
      return ListView(
        children: List.generate(provider.data['data']!.length, (index) {
          var item = provider.data['data']![index];
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(backgroundImage: NetworkImage(item['img']), radius: 25,),
                title: Row(
                  children: [
                    Text(item['model']),
                    Container(
                      padding: const EdgeInsets.fromLTRB(8, 2, 5, 2),
                      margin: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 226, 245, 255)
                      ),
                      child: Row(
                        children: [
                          Text(item['rating'].toString(), style: const TextStyle(fontSize: 12),),
                          const Icon(Icons.star_rounded, color: Colors.yellow, size: 17,)
                        ],
                      ),
                    ),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(NumberFormat.currency(locale: "id_ID", symbol: "Rp. ").format(item['price'])),
                    Text('by: ${item['developer']}', style: const TextStyle(fontSize: 12),),
                  ],
                ),
              ),
              const Divider()  // pemisah antar item
            ],
          );
        }),
      );
    }
  }

  menuList(BuildContext context) {
    final provider = Provider.of<Pertemuan11Provider>(context);
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry> [
          PopupMenuItem(
            child: ListTile(
              onTap: () {
                provider.ubahList('hp');
                Navigator.pop(context);
              },
              leading: const Icon(Icons.smartphone_rounded),
              title: const Text('HP'),
            )
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            child: ListTile(
              onTap: () {
                provider.ubahList('laptop');
                Navigator.pop(context);
              },
              leading: const Icon(Icons.laptop_rounded),
              title: const Text('Laptop'),
            )
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            child: ListTile(
              onTap: () {
                provider.clearList();
                Navigator.pop(context);
              },
              leading: const Icon(Icons.delete_sweep_rounded),
              title: const Text('Clear'),
            )
          ),
        ];
      }
    );
  }

  @override
  void initState() {
    Future.microtask(() {   // inisial data ke _data, krn ada proses jd hrs tunggu (async await promise)
      Provider.of<Pertemuan11Provider>(context, listen: false).initialData();
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('211110347 - Cindy Sintiya'),
        actions: [ menuList(context) ],
      ),
      body: body(context),
    );
  }
}