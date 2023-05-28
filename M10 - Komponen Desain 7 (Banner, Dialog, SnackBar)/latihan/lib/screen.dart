import 'package:flutter/material.dart';
import 'package:latihan/provider.dart';
import 'package:provider/provider.dart';

class LatihanScreen extends StatefulWidget {
  const LatihanScreen({super.key});

  @override
  State<LatihanScreen> createState() => _LatihanScreenState();
}

class _LatihanScreenState extends State<LatihanScreen> {
  showMyDialogBox(BuildContext context, BuildContext dialogContext) {
    final provider = Provider.of<LatihanProvider>(dialogContext);   // pake provider dr/ utk alertbox, bkn context
    return AlertDialog(
      title: const Text('Phone Ringtone', style: TextStyle(fontWeight: FontWeight.bold),),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var item in provider.ringtones)
              RadioListTile(
                value: item, 
                title: Text(item),
                groupValue: provider.chosen, 
                onChanged: (val) {
                  provider.chosen = val;
                }
              )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {Navigator.pop(dialogContext);},   // yg di pop = alertboxnya, gk bole contextnya
          child: const Text('CANCEL')
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(dialogContext);   // yg di pop = alertboxnya, gk bole contextnya
            if (provider.chosen == 'None') {
              ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 7),
                  content: const Text('Tidak ada Ringtone yang dipilih'),
                  action: SnackBarAction(
                    label: 'Coba Lagi',
                    textColor: Colors.white,
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                      showDialog(context: context, builder: (dialogContext) => showMyDialogBox(context, dialogContext));
                    },
                  ),
                )
              );
            }
            else {
              ScaffoldMessenger.of(context)..hideCurrentMaterialBanner()..showMaterialBanner(showMyBanner(context, provider.chosen));
            }
          }, 
          child: const Text('OK')
        ),
      ],
    );
  }

  showMyBanner(BuildContext context, chosen) {
    return MaterialBanner(
      content: Text('Ringtone baru saja diubah menjadi $chosen'), 
      leading: const Icon(Icons.card_giftcard, color: Colors.blue,),
      actions: [
        TextButton(
          onPressed: () async {
            ScaffoldMessenger.of(context).showSnackBar(showMySnackbar(context, chosen));
            await Future.delayed(const Duration(seconds: 3));
            if (mounted) {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            }
          }, 
          child: const Text('UPDATE')
        ),
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          }, 
          child: const Text('DISMISS')
        )
      ]
    );
  }

  showMySnackbar(BuildContext context, chosen) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 7),
      content: Text('Ringtone $chosen berhasil diterapkan.'),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context)..hideCurrentSnackBar()..hideCurrentMaterialBanner();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('211110347 - Cindy Sintiya'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton.icon(
          onPressed: () {
            // context = utk scaffold
            // dialogContext = utk alertbox
            showDialog(context: context, builder: (dialogContext) => showMyDialogBox(context, dialogContext));
          }, 
          icon: const Icon(Icons.ring_volume_rounded, size: 28,), 
          label: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Choose your ringtone', style: TextStyle(fontSize: 20),),
          )
        ),
      ),
    );
  }
}