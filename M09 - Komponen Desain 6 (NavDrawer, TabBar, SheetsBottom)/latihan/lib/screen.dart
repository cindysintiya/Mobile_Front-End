import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:latihan/provider.dart';
import 'package:latihan/login.dart';
import 'package:latihan/wishlists.dart';

class LatihanScreen extends StatefulWidget {
  const LatihanScreen({super.key});

  @override
  State<LatihanScreen> createState() => _LatihanScreenState();
}

class _LatihanScreenState extends State<LatihanScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LatihanProvider>(context);
    
    bottomSheets(BuildContext context, int i) {
      return Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: InkWell(
            onDoubleTap: () {
              showBottomSheet(
                enableDrag: true,
                backgroundColor: const Color.fromARGB(255, 251, 243, 253),
                elevation: 10,
                context: context, 
                builder: (context) {
                  return Wrap(
                    children: [
                      TextButton(
                        onPressed: () {provider.wishlist='bg$i.jpg'; Navigator.pop(context);},
                        child: Center(child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(provider.wishlist.contains('bg$i.jpg')? 'I hate it!' : 'I like it!', style: const TextStyle(fontSize: 18, color: Color(0xFFBB00FF)),),
                        ))
                      ),
                      TextButton(
                        onPressed: () {Navigator.pop(context);}, 
                        child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Center(child: Text('Cancel', style: TextStyle(color: Colors.red),)),
                        )
                      ),
                    ],
                  );
                }
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: provider.wishlist.contains('bg$i.jpg')? const Color(0xFFEBB5FF) : const Color.fromARGB(255, 250, 233, 255))
              ),
              child: !provider.wishlist.contains('bg$i.jpg')? 
                Image.asset('assets/bg$i.jpg', width: MediaQuery.of(context).size.width*0.95,) : 
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Image.asset('assets/bg$i.jpg', width: MediaQuery.of(context).size.width*0.95,),
                    const Icon(Icons.favorite_rounded, color: Colors.red, size: 35,)
                  ]
                )
            ),
          ),
        );
      });
    }

    return DefaultTabController(
      length: 2,  // jlh tab nntinya
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cindy Sintiya - 211110347'),
          bottom: const TabBar(   // mirip navbar, tp yg diatas
            // isScrollable: true,
            tabs: [
              Tab(text: 'Recommendations',),
              Tab(text: 'Destinations',),
            ],
          ),
        ),
        drawer: Drawer(
          semanticLabel: 'Profile',
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(    // space utk header Drawer
                padding: const EdgeInsets.only(left: 20),
                decoration: const BoxDecoration(color: Color(0xFFEBB5FF)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: ClipOval(child: Image.asset('assets/pics.jpg', fit: BoxFit.cover,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(provider.userInfo['username'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                          Text(provider.userInfo['userphone'], style: const TextStyle(color: Colors.white),),
                        ],
                      ),
                    )
                  ],
                )
              ),
              // const Divider(),
              ListTile(    // tampilan utk bwt 1 baris isi leading, title, trailing (kiri ke kanan)
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyWishlist()));
                },
                leading: const Icon(Icons.favorite_rounded),
                title: const Text('My Favorite'),
              ),
              ListTile(
                onTap: provider.userInfo['username']=='who?'? () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                } : () {
                  provider.logout();
                },
                leading: Icon(provider.userInfo['username']=='who?'? Icons.login_rounded : Icons.logout_rounded),
                title: Text(provider.userInfo['username']=='who?'? 'Login' : 'Logout'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TextButton(
              onPressed: () {}, 
              child: const Text('No Recommendations', style: TextStyle(fontSize: 16, color: Color(0xFFBB00FF)),)
            ),
            ListView(
              children: [ 
                for (var i=1; i<=5; i++) bottomSheets(context, i),
                const Padding(padding: EdgeInsets.only(bottom: 8))
              ],
            )
          ],
        ),
      ),
    );
  }
}