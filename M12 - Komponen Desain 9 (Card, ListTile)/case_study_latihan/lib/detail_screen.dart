import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:case_study_latihan/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.data});

  final Map data;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    Future.microtask(() {   // inisial data ke _data, krn ada proses jd hrs tunggu (async await promise)
      widget.data;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Pertemuan12Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ${widget.data['model']}'),
      ),
      body: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(widget.data['img']),),
              title: Row(
                children: [
                  Text(widget.data['model'], style: const TextStyle(fontWeight: FontWeight.bold),),
                  Container(
                    padding: const EdgeInsets.fromLTRB(8, 2, 5, 2),
                    margin: const EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 226, 245, 255)
                    ),
                    child: Row(
                      children: [
                        Text(widget.data['rating'].toStringAsFixed(1), style: const TextStyle(fontSize: 13),),
                        const Icon(Icons.star_rounded, color: Colors.yellow, size: 17,)
                      ],
                    ),
                  ),
                ],
              ),
              subtitle: Text(widget.data['developer']),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(widget.data['desc'], style: const TextStyle(fontSize: 16.5), textAlign: TextAlign.justify,),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Wrap(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Price only ', 
                      style: const TextStyle(fontSize: 18),
                      children: [
                        TextSpan(
                          text: ' ${NumberFormat.currency(locale: "id_ID", symbol: "Rp. ", decimalDigits: 0).format(widget.data['price'])},-',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                        )
                      ]
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {}, 
                    icon: const Icon(Icons.shopping_bag_outlined, size: 20,),
                    label: const Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Text('Buy Now', style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold),),
                    )
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(width: 0.25, color: Colors.black12), right: BorderSide(width: 0.25, color: Colors.black12))
                    ),
                    child: TextButton.icon(
                      onPressed: () {
                        if (widget.data['rating'] < 4.9) {
                          provider.liked(widget.data);
                        }
                      }, 
                      icon: const Icon(Icons.thumb_up_rounded, size: 17,), 
                      label: const Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
                        child: Text('Like'),
                      )
                    ),
                  )
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(width: 0.22, color: Colors.black12))
                    ),
                    child: TextButton.icon(
                      onPressed: () {}, 
                      icon: const Icon(Icons.share_rounded, size: 17,), 
                      label: const Padding(
                        padding: EdgeInsets.fromLTRB(5, 9.8, 0, 10),
                        child: Text('Share'),
                      )
                    )
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}