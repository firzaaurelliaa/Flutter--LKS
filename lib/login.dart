// ignore_for_file: unrelated_type_equality_checks, avoid_print, avoid_unnecessary_containers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lks_android/isi_data_diri.dart';
import 'package:lks_android/main.dart';
import 'package:lks_android/navbar.dart';
import 'package:lks_android/tambah.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  TextEditingController username = TextEditingController();
  TextEditingController katasandi = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 135,
                    height: 135,
                    child: Image.asset('assets/images/logo.png')),
                const SizedBox(height: 40),
                const Text(
                  'Hi \nSelamat datang!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                const Text(
                  'Isi data pribadi anda',
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 61, 60, 60)),
                ),
                const SizedBox(height: 50),
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        cursorColor: const Color(0xff4E944F),
                        enableSuggestions: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: username,
                        decoration: const InputDecoration(
                          labelText: "Username :",
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 124, 123, 123)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff4E944F)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
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
                      const SizedBox(
                        height: 50,
                      ),
                      loading
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xff4E944F)))
                          : SizedBox(
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary:
                                      const Color.fromARGB(255, 222, 222, 222),
                                  onPrimary:
                                      const Color.fromARGB(255, 124, 123, 123),
                                ),
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NavBar()),
                                      (route) => false);
                                },
                                child: const Text(
                                  "Masuk",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(height: 20),
                      loading
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xff4E944F)))
                          : SizedBox(
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: const Color(0xff4E944F)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => IsiDataDiri()),
                                  );
                                },

                                //BACA ON PRESSED INI, PENTING
                                // onPressed: ()  {
                                //   setState(() {
                                //     loading = true;
                                //     const Center(
                                //       child: const CircularProgressIndicator(
                                //           color: Colors.red),
                                //     );
                                //   });

                                //   //Ngasi kondisi jika udah keisi boleh lanjut, kalo ada yg kosong suruh isi
                                //   if (username.text.isNotEmpty &&
                                //       katasandi.text.isNotEmpty) {
                                //     //Kalo firebase nyambunginnya disini, controller diatas disambungin, gini (contoh aja)
                                //     // FirebaseFirestore.instance
                                //     //     .collection('statistikPertandingan')
                                //     //     .doc(widget.id)
                                //     //     .update(
                                //     //   {
                                //     //     'tim1': {
                                //     //       'tendanganKeGawang':
                                //     //           tim1tendangankegawang.text,
                                //     //       'tendangan': tim1tendangan.text,
                                //     //       'penguasaanBola':
                                //     //           tim1penguasaanbola.text,
                                //     //       'pelanggaran': tim1pelanggaran.text,
                                //     //       'kartuKuning': tim1kartukuning.text,
                                //     //       'kartuMerah': tim1kartumerah.text,
                                //     //     },
                                //     //   },
                                //     // )
                                //     //.whenComplete(() {
                                //     //   Navigator.pop(
                                //     //     context,
                                //     //   );
                                //     // });

                                //     //liat "whenComplete diatas, kalo udah komplit,
                                //     //arahin ke halaman navbar (masuk aplikasi berati), tapi dikarenakan aku bingung database kamu,
                                //     //jadi nanti aja ya validasi inputan ga boleh kosong mah, tapi naro nya disitu kalo firebase "
                                //   } else {
                                //     ScaffoldMessenger.of(context)
                                //         .showSnackBar(const SnackBar(
                                //       content:
                                //           Text('Inputan tidak boleh kosong!'),
                                //       backgroundColor: Colors.red,
                                //     ));
                                //   }
                                //   setState(() {
                                //     loading = false;
                                //   });
                                // },

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
            ),
          ),
        ],
      ),
    );
  }
}
