import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:baloonblooms/components/custom_color.dart';
import 'package:baloonblooms/providers/feedback_provider.dart';

class Feedbacks extends StatefulWidget {
  const Feedbacks({super.key, required this.title});
  final String title;

  @override
  State<Feedbacks> createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
 
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<FeedbackProvider>(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: prov.reviews.map<Widget>((review) {
          return Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.3, color: Colors.black38)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: myCustomColor()[500],
                  foregroundColor: Colors.black,
                  child: Text(review['nama'][0]),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width <= 375 ? MediaQuery.of(context).size.width*0.17 : null,
                                child: Text(
                                  review['anonim']? 'anonymous' : review['inisial']? review['nama'][0]+'*'*(review['nama'].length-2) : review['nama'],
                                  overflow: TextOverflow.ellipsis, 
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text('|'),
                              ),
                              Text(review['kepuasan'], style: const TextStyle(fontSize: 12, color: Colors.black54),)
                            ],
                          ),
                          Text(review['tgl'].split(' ')[0]==DateFormat('dd-MM-yyyy').format(DateTime.now())? review['tgl'].split(' ')[1] : review['tgl'].split(' ')[0])
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: review['komentar'].isNotEmpty? Text(review['komentar']) : null,
                      ),
                      Wrap(
                        alignment: WrapAlignment.start,
                        children: 
                          review['tags'].map<Widget>((tag) {
                            return Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              margin: const EdgeInsets.only(right: 5, top: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: myCustomColor()[100]
                              ),
                              child: Text(tag),
                            );
                          }).toList(),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}