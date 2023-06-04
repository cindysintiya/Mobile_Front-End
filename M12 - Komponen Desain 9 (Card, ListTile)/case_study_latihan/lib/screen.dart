import 'package:case_study_latihan/detail_screen.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:case_study_latihan/provider.dart';

class Pertemuan12Screen extends StatefulWidget {
  const Pertemuan12Screen({super.key});

  @override
  State<Pertemuan12Screen> createState() => _Pertemuan12ScreenState();
}

class _Pertemuan12ScreenState extends State<Pertemuan12Screen> {
  body(BuildContext context) {
    final provider = Provider.of<Pertemuan12Provider>(context);
    if (provider.data == null) {   // menghindari data null
      return const Center(child: CircularProgressIndicator());
    }
    else if (provider.data.isEmpty) {
      return const Center(
        child: Text('Data tidak ditemukan', style: TextStyle(fontSize: 20),),
      );
    }
    else {
      // return ListView(
      return GridView.extent(
        maxCrossAxisExtent: 310,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(provider.data['data']!.length, (index) {
          var item = provider.data['data']![index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(data: item)));
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(item['img']),),
                    title: Text(item['model']),
                    subtitle: Text(item['developer']),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                    child: Text(
                      // item['desc'].toString().length >= 100? '${item['desc'].toString().substring(0, 100)} ... read more' : item['desc'],
                      item['desc'].toString().length >= 90? '${item['desc'].toString().substring(0, 90)} ... read more' : item['desc'],
                      style: TextStyle(color: Colors.black.withOpacity(0.6)), 
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          Text('${NumberFormat.currency(locale: "id_ID", symbol: "Rp. ", decimalDigits: 0).format(item['price'])},-'),
                          Text('Rating ${item['rating'].toStringAsFixed(1)}')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (item['rating'] < 4.9) {
                                provider.liked(item);
                              }
                            }, 
                            splashRadius: 20,
                            icon: const Icon(Icons.thumb_up_rounded)
                          ),
                          IconButton(
                            onPressed: () {}, 
                            splashRadius: 20,
                            icon: const Icon(Icons.share_rounded)
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      );
    }
  }

  menuList(BuildContext context) {
    final provider = Provider.of<Pertemuan12Provider>(context);
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry> [
          PopupMenuItem(
            onTap: () {
              provider.ubahList('hp');
              // Navigator.pop(context);
            },
            child: const ListTile(
              leading: Icon(Icons.smartphone_rounded),
              title: Text('HP'),
            )
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            onTap: () {
              provider.ubahList('laptop');
              // Navigator.pop(context);
            },
            child: const ListTile(
              leading: Icon(Icons.laptop_rounded),
              title: Text('Laptop'),
            )
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            onTap: () {
              provider.clearList();
              // Navigator.pop(context);
            },
            child: const ListTile(
              leading: Icon(Icons.delete_sweep_rounded),
              title: Text('Clear'),
            )
          ),
        ];
      }
    );
  }

  @override
  void initState() {
    Future.microtask(() {   // inisial data ke _data, krn ada proses jd hrs tunggu (async await promise)
      Provider.of<Pertemuan12Provider>(context, listen: false).initialData();
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