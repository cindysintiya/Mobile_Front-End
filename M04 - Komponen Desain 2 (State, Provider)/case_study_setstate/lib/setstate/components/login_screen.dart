import 'package:flutter/material.dart';
import 'produk_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // locale variable
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String loginText = 'Login';
  double defaultPadding = 20;

  // status username dan password : kosong
  bool? isUsernameEmpty;
  bool? isPasswordEmpty;

  @override
  void initState() {
    // inisialisasi default state. tampil saat pertama kali app di run
    usernameController.text = 'Mikroskil';
    isUsernameEmpty = false;
    isPasswordEmpty = false;

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loginText),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // login form
                SizedBox(
                  child: Column(
                    children: [
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          label: const Text('Username'),
                          errorText: isUsernameEmpty == true ? 'username harus diisi' : null
                        ),
                      ),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          errorText: isPasswordEmpty == true ? 'kata sandi harus diisi' : null
                        ),
                      )
                    ],
                  ),
                ),
                // Spacer() mirip flex, utk atur jarak antara widget di flex, container, column, row
                // const Spacer(),
                const SizedBox(height: 20,),
                // login button
                ElevatedButton(
                  onPressed: () {
                    // validasi username dan password empty
                    if (usernameController.text.isEmpty) {
                      setState(() {
                        isPasswordEmpty = false;
                        isUsernameEmpty = true;
                      });
                    }
                    else if (passwordController.text.isEmpty) {
                      setState(() {
                        isUsernameEmpty = false;
                        isPasswordEmpty = true;
                      });
                    }
                    // jika tdk ada lg kesalahan
                    else {
                      setState(() {
                        isUsernameEmpty = false;
                        isPasswordEmpty = false;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        // passing data to another screen
                        return ProdukScreen(
                          username: usernameController.text
                        );
                      }));
                    }
                  }, 
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width / 2 + 100, 50),
                  ),
                  child: Text(loginText),
                )
              ],
            )
          ),
        )
      ),
    );
  }
}