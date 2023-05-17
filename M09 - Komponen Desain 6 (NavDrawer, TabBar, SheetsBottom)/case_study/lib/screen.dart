import 'package:flutter/material.dart';

class Pertemuan9Screen extends StatefulWidget {
  const Pertemuan9Screen({super.key});

  @override
  State<Pertemuan9Screen> createState() => _Pertemuan9ScreenState();
}

class _Pertemuan9ScreenState extends State<Pertemuan9Screen> {
  @override
  Widget build(BuildContext context) {
    bottomSheets(BuildContext context) {
      return Builder(builder: (context) {
        return Center(
          child: TextButton(
            onPressed: () {
              showBottomSheet(
                enableDrag: true,
                context: context, 
                builder: (context) {
                  final theme = Theme.of(context);
                  return Wrap(
                    children: [
                      ListTile(
                        title: const Text('Header',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                        tileColor: theme.colorScheme.primary,
                        trailing: IconButton(
                          onPressed: () {Navigator.pop(context);},
                          splashRadius: 20,
                          icon: const Icon(Icons.close, color: Colors.white,),
                        ),
                      ),
                      const ListTile(title: Text('Facebook'),),
                      const ListTile(title: Text('Twitter'),)
                    ],
                  );
                }
              );
            },
            child: const Text('Social Media Share'),
          ),
        );
      });
    }

    return DefaultTabController(
      length: 4,  // jlh tab nntinya
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cindy Sintiya - 211110347'),
          bottom: TabBar(   // mirip navbar, tp yg diatas
            isScrollable: true,
            tabs: const [
              Tab(child: Text('Share', textAlign: TextAlign.center,),),
              Tab(child: Text('Music', textAlign: TextAlign.center,),),
              Tab(child: Text('Favorite', textAlign: TextAlign.center,),),
              Tab(child: Text('Saved', textAlign: TextAlign.center,),),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(    // space utk header Drawer
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(color: Colors.purple),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Image.asset('assets/pics.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Cindy Sintiya', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                          Text('211110347', style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    )
                  ],
                )
              ),
              const Divider(),
              ListTile(    // tampilan utk bwt 1 baris isi leading, title, trailing (kiri ke kanan)
                onTap: () {},
                leading: const Icon(Icons.inbox),
                title: const Text('Inbox'),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.save),
                title: const Text('Archieved'),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.download),
                title: const Text('Saved'),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            bottomSheets(context),
            TextButton(
              onPressed: () {print('Home');}, 
              child: const Text('Home')
            ),
            TextButton(
              onPressed: () {print('Favorite');}, 
              child: const Text('Favorite')
            ),
            TextButton(
              onPressed: () {print('Saved');}, 
              child: const Text('Saved')
            ),
          ],
        ),
      ),
    );
  }
}