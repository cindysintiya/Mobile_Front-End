import 'package:flutter/material.dart';
import 'package:case_study_latihan/profile/profile_detail_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile (211110347 - Cindy Sintiya)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.yellow,
                child: Align(
                  alignment: FractionalOffset(0.2, 0.6),
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/beautiful bg.jpg', width: 100,),
                Image.asset('assets/beautiful bg.jpg', width: 100),
                Image.asset('assets/beautiful bg.jpg', width: 100),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/beautiful bg.jpg', width: 100),
                Image.asset('assets/beautiful bg.jpg', width: 100),
                Image.asset('assets/beautiful bg.jpg', width: 100),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  child: const Text('Kembali')
                ),
                // SizedBox(width: 50,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileDetailScreen()));
                  }, 
                  child: const Text('Profile Detail')
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.call, color: Colors.blue,),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('CALL', style: TextStyle(color: Colors.blue),),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.send, color: Colors.blue,),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('ROUTE', style: TextStyle(color: Colors.blue),),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.share, color: Colors.blue,),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('SHARE', style: TextStyle(color: Colors.blue),),
                    ),
                  ],
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}