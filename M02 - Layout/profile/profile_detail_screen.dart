import 'package:flutter/material.dart';
import 'package:case_study_latihan/custom.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Detail (211110347 - Cindy Sintiya)'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Ini adalah Detail Profile', style: TextStyle(fontSize: 22),),
            Wrap(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              alignment: WrapAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(5.0),
                      width: 220,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.blue[50],
                      ),
                      child: Text('Strawberry Pavlova', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      width: 220,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.blue[50],
                      ),
                      child: Text('Pavlova is a meringue-based dessert named after the Russian ballerine Anna Pavlova.\nPavlova featues a crisp crust and soft, light inside, topped with fruit and whipped cream.', textAlign: TextAlign.center, softWrap: true,),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      width: 220,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.blue[50],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, size: 18,),
                              Icon(Icons.star, size: 18,),
                              Icon(Icons.star, size: 18,),
                              Icon(Icons.star, size: 18,),
                              Icon(Icons.star, size: 18,),
                            ],
                          ),
                          Text('170 Reviews'),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      width: 220,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.blue[50],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.kitchen_outlined, color: Colors.lightGreen, size: 20,),
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 8),
                                child: Text('PREP:', style: TextStyle(fontSize: 12),),
                              ),
                              Text('25 min', style: TextStyle(fontSize: 12),),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.timer_outlined, color: Colors.lightGreen, size: 20,),
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 8),
                                child: Text('COOK:', style: TextStyle(fontSize: 12),),
                              ),
                              Text('1 hr', style: TextStyle(fontSize: 12),),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.restaurant, color: Colors.lightGreen, size: 20,),
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 8),
                                child: Text('FEEDS:', style: TextStyle(fontSize: 12),),
                              ),
                              Text('4-6', style: TextStyle(fontSize: 12),),
                            ],
                          ),
                        ],
                      )
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 10.0),
                  child: Image.asset('assets/beautiful bg.jpg', width: 450,),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  child: const Text('Kembali')
                ),
                SizedBox(height: 15,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomScreen()));
                  }, 
                  child: const Text('Lihat Custom GridView Builder')
                ),
              ],
            )
          ]
        ),
      ),
    );
  }
}

// TIDAK BOLEH MEMASUKKAN GRIDVIEW KEDALAM COLUMN/ ROW