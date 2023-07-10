import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b_kreazi/providers/burger_provider.dart';
import 'package:b_kreazi/providers/login_provider.dart';
import 'package:b_kreazi/providers/user_provider.dart';
import 'package:b_kreazi/pages/signup_page.dart.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final provLogin = Provider.of<LoginProvider>(context);
    final provUser = Provider.of<UserProvider>(context);
    final provBurger = Provider.of<BurgerProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to Your Account'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
        children: [
          Image.asset('B_Kreazi.png', width: 100, height: 50,),
          const SizedBox(height: 25,),
          TextField(
            controller: provLogin.username,
            onChanged: (val) {
              provLogin.status = 'process';
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              icon: const Icon(Icons.person),
              hintText: 'your_username',
              label: const Text('Username'),
              errorText: provLogin.status == 'not ok' && provLogin.username.text.isNotEmpty && !provLogin.database.toString().contains("username: ${provLogin.username.text},")? 'Username tidak ditemukan' : null
            ),
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r"[']"))
            ],
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: provLogin.password,
            obscureText: true,
            obscuringCharacter: '*',
            onChanged: (val) {
              provLogin.status = 'process';
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              icon: const Icon(Icons.password_rounded),
              hintText: 'pa*****d',
              label: const Text('Password'),
              errorText: provLogin.status == 'not ok' && provLogin.username.text.isNotEmpty && provLogin.password.text.isNotEmpty && provLogin.database.toString().contains("username: ${provLogin.username.text},") && provLogin.database.firstWhere((element) => element['username'] == provLogin.username.text)['password']!=provLogin.password.text? 'Password salah' : null
            ),
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r' ')),
            ],
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
            onPressed: provLogin.username.text.trim().isEmpty || provLogin.password.text.trim().isEmpty ? null : () {
              if (provLogin.username.text.isNotEmpty && provLogin.password.text.isNotEmpty && provLogin.database.toString().contains("username: ${provLogin.username.text},") && provLogin.database.firstWhere((element) => element['username'] == provLogin.username.text)['password']==provLogin.password.text) {
                provLogin.status = 'new';
                provLogin.loggedIn();
                final loginData = provLogin.database.firstWhere((element) => element['username'] == provLogin.username.text);
                final userInfo = {
                  'Nama' : loginData['fullname'],
                  'No HP' : loginData['phone'],
                  'Gender' : loginData['gender'],
                };
                provBurger.userInfo = userInfo;
                provUser.saveUser = userInfo;
                provBurger.nama.text = loginData['fullname'];
                provBurger.noHp.text = loginData['phone'];
                provBurger.changeGender = loginData['gender'];
                Navigator.pop(context);
              }
              else {
                provLogin.status = 'not ok';
              }
            }, 
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Masuk', style: TextStyle(fontSize: 17),),
            )
          ),
          const SizedBox(height: 10,),
          OutlinedButton(
            onPressed: () {
              provLogin.status = 'new';
              Navigator.push(context, MaterialPageRoute(builder: ((context) => const SignUpPage())));
            }, 
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Daftar', style: TextStyle(fontSize: 17),),
            )
          )
        ],
      ),
    );
  }
}