import 'package:flutter/material.dart';

class UpdateAvailable extends StatefulWidget {
  const UpdateAvailable({super.key});

  @override
  State<UpdateAvailable> createState() => _UpdateAvailableState();
}

class _UpdateAvailableState extends State<UpdateAvailable> {
  showMySnackBar(BuildContext context) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 5),
      backgroundColor: const Color.fromARGB(255, 152, 90, 105),
      content: updateStatus? const Text('Aplikasi berhasil di update') : const Text('Sedang diupdate'),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
  }

  showMyDialog(BuildContext context) {
    return const AlertDialog(
      title: Text('Sedang diupdate. Mohon tunggu sebentar...', style: TextStyle(fontSize: 15),),
      content: LinearProgressIndicator(),
    );
  }

  showMyBanner(BuildContext context) {
    return MaterialBanner(
      content: const Text('Update baru tersedia!'), 
      leading: const Icon(Icons.update_rounded),
      actions: [
        TextButton(
          onPressed: () async {
            showDialog(
              context: context, 
              barrierDismissible: false,
              builder: (context) => showMyDialog(context)
            );
            await Future.delayed(const Duration(seconds: 5));
            setState(() {
              updateStatus = true;
            });
            if (mounted) {
              Navigator.pop(context);   // hilangkan dialog box
              ScaffoldMessenger.of(context).showSnackBar(showMySnackBar(context));
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            }
          }, 
          child: const Text('Update Now')
        ),
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            setState(() {
              if (!updateStatus) {
                showButton = true;
              }
            });
          }, 
          child: const Text('Dismiss')
        )
      ]
    );
  }

  bool showButton = true;
  bool updateStatus = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showButton && !updateStatus,
      child: TextButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(context)
          ..removeCurrentMaterialBanner()
          ..showMaterialBanner(showMyBanner(context));
          setState(() {
            showButton = false;
          });
        }, 
        style: const ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 152, 90, 105))
        ),
        icon: const Icon(Icons.info_outline_rounded),
        label: const Text('New Update!')
      ),
    );
  }
}