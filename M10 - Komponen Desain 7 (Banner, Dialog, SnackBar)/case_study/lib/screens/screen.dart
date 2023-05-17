import 'package:flutter/material.dart';
import 'package:case_study/components/fullscreen_dialog_widget.dart';

class Pertemuan10Screen extends StatefulWidget {
  const Pertemuan10Screen({super.key});

  @override
  State<Pertemuan10Screen> createState() => _Pertemuan10ScreenState();
}

class _Pertemuan10ScreenState extends State<Pertemuan10Screen> {
  showBanner(BuildContext context) {
    return MaterialBanner(    // menampilkan banner dgn style material
      content: const Text('Welcome to Banner Info!'),
      leading: const Icon(Icons.info, color: Colors.orange,), 
      actions: [   // tombol di bawah kanan banner
        TextButton(onPressed: () {}, child: const Text('Agree')),
        TextButton(
          onPressed: () {
            // menutup banner yg sdg aktif/ tampil
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          }, 
          child: const Text('Dismiss')
        ),

      ]
    );
  }

  showAlertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Reset Settings?'),
      content: const Text('This will reset your device to its default factory settings.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          child: const Text('Cancel')
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          child: const Text('ACCEPT')
        ),
      ],
    );
  }

  showSimpleDialog(BuildContext context) {
    return SimpleDialog(
      title: const Text('Set backup account'),
      children: List.generate(4, (index) {   // membuat list otomatis
        return SimpleDialogOption(   // menampilkan action mirip textbutton
          onPressed: () => Navigator.pop(context, 'mail$index@gmail.com'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.abc, color: Colors.amber,),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Username$index'),
              )
            ],
          ),
        );
      }),
    );
  }
  
  showSnackBar(BuildContext context) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 6),
      content: const Text('Welcome to snackbar'),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('211110347 - Cindy Sintiya'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16,),
          MaterialBanner(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Banner', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Text('Text.')
              ],
            ), 
            actions: [
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                  ..removeCurrentMaterialBanner()   // bersihkan dulu banner yg ada
                  ..showMaterialBanner(showBanner(context));  // tampilkan banner yg diinginkan
                }, 
                child: const Text('Show Banner')
              )
            ]
          ),
          MaterialBanner(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Dialogs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Text('Text')
              ],
            ), 
            actions: [
              TextButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) => showAlertDialog(context));
                }, 
                child: const Text('Alert Dialog')
              ),
              TextButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) => showSimpleDialog(context));
                }, 
                child: const Text('Simple Dialog')
              ),
              TextButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) => const FullScreenDialog());
                }, 
                child: const Text('Fullscreen Dialog')
              ),
            ]
          ),
          MaterialBanner(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Snackbars', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Text('Snackbars provide brief message about app processed at the bottom of the screen.')
              ],
            ), 
            actions: [
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(showSnackBar(context));
                }, 
                child: const Text('Snackbar')
              )
            ]
          )
        ],
      ),
    );
  }
}