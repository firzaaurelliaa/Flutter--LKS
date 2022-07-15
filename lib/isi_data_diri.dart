// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lks_android/navbar.dart';
import 'package:lks_android/tambah.dart';

class IsiDataDiri extends StatefulWidget {
  IsiDataDiri({Key? key}) : super(key: key);

  @override
  State<IsiDataDiri> createState() => _IsiDataDiriState();
}

class _IsiDataDiriState extends State<IsiDataDiri> {
  TextEditingController nama = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController alamat = TextEditingController();

  TextEditingController katasandi = TextEditingController();

  TextEditingController konfirmasikatasandi = TextEditingController();

  bool _isHidePassword = true;
  bool _isHideKonfirPassword = true;

  bool loading = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  void _toggleKonfirPasswordVisibility() {
    setState(() {
      _isHideKonfirPassword = !_isHideKonfirPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        'Silahkan isi data pribadi anda!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    cursorColor: const Color(0xff4E944F),
                    autofocus: false,
                    controller: nama,
                    decoration: InputDecoration(
                      labelText: "Nama Lengkap :",
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 124, 123, 123)),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4E944F)),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    cursorColor: const Color(0xff4E944F),
                    autofocus: false,
                    controller: username,
                    decoration: InputDecoration(
                      labelText: "Username :",
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 124, 123, 123)),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4E944F)),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    cursorColor: const Color(0xff4E944F),
                    autofocus: false,
                    controller: alamat,
                    decoration: InputDecoration(
                      labelText: "Alamat :",
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 124, 123, 123)),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4E944F)),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    cursorColor: const Color(0xff4E944F),
                    obscureText: _isHidePassword,
                    autofocus: false,
                    controller: katasandi,
                    decoration: InputDecoration(
                      labelText: "Kata sandi :",
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 124, 123, 123)),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4E944F)),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _togglePasswordVisibility();
                        },
                        child: Icon(
                          _isHidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: _isHidePassword
                              ? Colors.grey
                              : const Color(0xff4E944F),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    cursorColor: const Color(0xff4E944F),
                    obscureText: _isHidePassword,
                    autofocus: false,
                    controller: konfirmasikatasandi,
                    decoration: InputDecoration(
                      labelText: "Konfirmasi kata sandi :",
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 124, 123, 123)),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4E944F)),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _toggleKonfirPasswordVisibility();
                        },
                        child: Icon(
                          _isHideKonfirPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: _isHideKonfirPassword
                              ? Colors.grey
                              : const Color(0xff4E944F),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  loading
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xff4E944F)))
                      : SizedBox(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0, primary: const Color(0xff4E944F)),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavBar()),
                                  (route) => false);
                            },
                            child: const Text(
                              "Daftar",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ));
  }
}
