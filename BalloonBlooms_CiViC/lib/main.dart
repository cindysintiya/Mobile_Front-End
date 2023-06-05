import 'package:flutter/material.dart';
import 'package:baloonblooms/screens/minggu1.dart';
import 'package:baloonblooms/screens/minggu2.dart';
// import 'package:baloonblooms/screens/minggu4.dart';
import 'package:baloonblooms/screens/minggu11.dart';
import 'package:baloonblooms/screens/minggu5.dart';
// import 'package:baloonblooms/screens/minggu6.dart';
import 'package:baloonblooms/components/minggu9.dart';
import 'package:baloonblooms/components/custom_color.dart';  // import library custom warna

import 'package:provider/provider.dart';
import 'package:baloonblooms/providers/product_provider.dart';
import 'package:baloonblooms/providers/wishlist_provider.dart';
import 'package:baloonblooms/providers/comment_provider.dart';
import 'package:baloonblooms/providers/notification_provider.dart';
import 'package:baloonblooms/providers/feedback_provider.dart';
import 'package:baloonblooms/providers/login_provider.dart';
import 'package:baloonblooms/providers/custom_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // tambah provider(s) mu disini
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ChangeNotifierProvider(create: (_) => CommentProvider()),
        ChangeNotifierProvider(create: (_) => NotifProvider()),
        ChangeNotifierProvider(create: (_) => FeedbackProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => CustomProvider()),
      ],
      child:  MaterialApp(
        title: 'BalloonBlooms - CiViC',
        theme: ThemeData(
          primarySwatch: myCustomColor(),  // appbar, elevatedbutton
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        debugShowCheckedModeBanner: false,
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  void onTabTapped(val) {
    setState(() {
      _currentIndex = val;
    });
  }

  TextEditingController searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provProduk = context.watch<ProductProvider>();
    final List pages = [
      const Home(title: 'Welcome to BalloonBlooms!'),
      Product(title: 'Product', search: provProduk.searchVal,),
      // const Wishlist(title: 'Wishlist',),
      // const Notifications(title: 'Notification'),
      const Feedbacks(title: 'Feedbacks'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: pages[_currentIndex].title != 'Product'? Text(pages[_currentIndex].title) : 
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.5),
            borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          margin: const EdgeInsets.all(20),
          child: TextField(
            controller: searchCtrl,
            onChanged: (val) {
              provProduk.searchVal = val;
              provProduk.changeProduct = '';
            },
            onSubmitted: (val) {
              provProduk.searchVal = val.trim();
              provProduk.changeProduct = val.trim();
            },
            decoration: InputDecoration(
              icon: const Icon(Icons.search_rounded),
              suffixIcon: provProduk.searchVal.isEmpty? null : 
                IconButton(icon: const Icon(Icons.clear_rounded), 
                  onPressed: () {
                    searchCtrl.text = '';
                    provProduk.searchVal = '';
                    provProduk.changeProduct = '';
                  },
                ),
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: 'Search Product ...',
              hintStyle: const TextStyle(fontSize: 18)
            ),
            style: const TextStyle(fontSize: 17),
          ),
        ),
      ),
      drawer: const NavDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), 
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view), 
            activeIcon: Icon(Icons.grid_view_rounded),
            label: 'Product', 
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.favorite_border_rounded), 
          //   activeIcon: Icon(Icons.favorite_rounded),
          //   label: 'Wishlist', 
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.notifications_none), 
          //   activeIcon: Icon(Icons.notifications_rounded),
          //   label: 'Notification', 
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined), 
            activeIcon: Icon(Icons.article_rounded),
            label: 'Feedback', 
          ),
        ],
        selectedItemColor: myCustomColor(),
        unselectedItemColor: Colors.black,
      ),
      body: pages[_currentIndex],
      floatingActionButton: pages[_currentIndex].title == 'Feedbacks'? 
        FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddFeedback()));
          }, 
          tooltip: 'Give Feedback',
          backgroundColor: myCustomColor(),
          child: const Icon(Icons.edit_note_rounded),
        )
        : null
    );
  }
}
