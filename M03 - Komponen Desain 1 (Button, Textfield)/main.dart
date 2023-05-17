import 'package:flutter/material.dart';
import 'package:latihan/todos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '211110347 - Cindy Sintiya',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: '211110347 - Cindy Sintiya'),
      debugShowCheckedModeBanner: false,    // supaya tulisan debug di kanan atas ilang
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'It`s empty here',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Image.network(
              'https://t3.ftcdn.net/jpg/04/59/40/12/360_F_459401247_gbWn6xuQmiDv11uFYFZPwaQQOE6vA1dc.jpg',
              width: 350,
            ),
            const Text(
              'Hit the + button to add a new task',
              style: TextStyle(fontSize: 18)
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const TodosScreen()));
        },
        tooltip: 'Add Todos',
        child: const Icon(Icons.add),
      ),
    );
  }
}
