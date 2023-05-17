import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:latihan/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LatihanProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: provider.username,
              decoration: InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Username Anda disini',
                label: const Text('Username'),
                errorText: provider.status != 'new' && provider.username.text.trim().isEmpty? 'Wajib diisi' : provider.username.text.trim().toLowerCase() == 'who?'? 'Username invalid' : null
              ),
            ),
            TextField(
              controller: provider.userphone,
              decoration: InputDecoration(
                icon: const Icon(Icons.call),
                hintText: 'No Hp Anda disini',
                label: const Text('Phone Number'),
                errorText: provider.status != 'new' && provider.userphone.text.trim().isEmpty? 'Wajib diisi' : provider.userphone.text.trim() == '-'? 'Phone Number invalid' : null
              ),
              keyboardType: TextInputType.phone,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    }, 
                    child: const Text('Batal')
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (provider.username.text.trim().isEmpty || provider.userphone.text.trim().isEmpty || provider.username.text.trim().toLowerCase() == 'who?' || provider.userphone.text.trim() == '-') {
                        provider.status = 'invalid';
                      }
                      else {
                        provider.login = {
                          'username' : provider.username.text.trim(),
                          'userphone' : provider.userphone.text.trim()
                        };
                        provider.username.text = '';
                        provider.userphone.text = '';
                        Navigator.pop(context);
                      }
                    }, 
                    child: const Text('Login')
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}