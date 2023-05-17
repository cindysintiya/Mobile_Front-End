import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b_kreazi/providers/navigation_provider.dart';
import 'package:b_kreazi/providers/burger_provider.dart';
import 'package:b_kreazi/providers/order_provider.dart';
import 'package:b_kreazi/providers/user_provider.dart';
import 'package:b_kreazi/providers/officialmenu_provider.dart';
import 'package:b_kreazi/providers/notification_provider.dart';
import 'package:b_kreazi/components/custom_color.dart';
import 'package:b_kreazi/screens/home_screen.dart';
import 'package:b_kreazi/screens/order_screen.dart';
import 'package:b_kreazi/pages/user_profile.dart';
import 'package:b_kreazi/pages/all_menu.dart';
import 'package:b_kreazi/pages/notifications.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ChangeNotifierProvider(create: (_) => BurgerProvider()),
      ChangeNotifierProvider(create: (_) => OrderProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => OfficialMenuProvider()),
      ChangeNotifierProvider(create: (_) => NotificationProvider()),
    ],
    child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'B_Kreazi',
      theme: ThemeData(
        primarySwatch: myCustomColor(),
        fontFamily: 'Gill Sans MT',
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final provNav = Provider.of<NavigationProvider>(context);
    final provUser = Provider.of<UserProvider>(context);
    final provNotif = Provider.of<NotificationProvider>(context);
    final List pages = [
      const Home(title: 'B_Kreazi'),
      const OrderScreen(title: 'Order'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[provNav.currentIndex].title),
      ),
      drawer: Drawer(
        semanticLabel: 'Menu',
        child: ListView(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(color: myCustomColor()),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: provUser.userInfo.isNotEmpty? provUser.userInfo['Gender'] == 'Laki-Laki'? Colors.blue : Colors.pink : Colors.black54,
                    // child: ClipOval(child: Image.asset('assets/pics.jpg', fit: BoxFit.cover,)),  // utk ganti foto
                    child: Text(provUser.userInfo.isEmpty? '?' : provUser.userInfo['Nama'][0], style:  const TextStyle(fontSize: 30, color: Colors.white),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(provUser.userInfo.isEmpty? 'username' : provUser.userInfo['Nama'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                        Text(provUser.userInfo.isEmpty? 'phone number' : provUser.userInfo['No HP'], style: const TextStyle(color: Colors.white),),
                      ],
                    ),
                  )
                ],
              )
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfile(title: 'Profil Pengguna',)));
              },
              leading: const Icon(Icons.person_rounded),
              title: const Text('Profil Akun'),
              subtitle: const Text('Edit, Lihat detail informasi pribadi'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AllMenu(title: 'Menu Official',)));
              },
              leading: const Icon(Icons.flatware_rounded),
              title: const Text('Menu'),
              subtitle: const Text('Daftar menu original B_Kreazi'),
            ),
            ListTile(
              onTap: () {
                provNotif.changeNotifType = 'Semua';
                provNotif.showUnreadOnly = false;
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Notifications(title: 'Notifikasi',)));
              },
              leading: provNotif.allNotif.where((notif) => notif['read']==false).isEmpty?
              const Icon(Icons.notifications_none_rounded) : 
              Stack(
                alignment: Alignment.topRight,
                children: [
                  provNotif.allNotif.where((notif) => notif['read']==false).isEmpty? 
                  const Icon(Icons.notifications_none_rounded) :
                  CircleAvatar(
                    radius: 6.75,
                    backgroundColor: myCustomDarkerColor(),
                    child: Text(provNotif.allNotif.where((notif) => notif['read']==false).length.toString(), style: const TextStyle(fontSize: 10, color: Colors.white),),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(Icons.notifications_none_rounded),
                  ),
                ],
              ),
              title: const Text('Notifikasi'),
              subtitle: const Text('Pengingat pesanan'),
            ),
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: pages[provNav.currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: myCustomDarkerColor(),
        onTap: (val) {
          provNav.currentIndex = val;
        },
        currentIndex: provNav.currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), 
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_rounded), 
            activeIcon: Icon(Icons.receipt_long),
            label: 'Order', 
          ),
        ],
      ),
    );
  }
}