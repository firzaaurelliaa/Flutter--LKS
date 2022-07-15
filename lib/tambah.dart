// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lks_android/invoice.dart';

class Tambah extends StatefulWidget {
  Tambah({Key? key}) : super(key: key);

  @override
  State<Tambah> createState() => _TambahState();
}

class _TambahState extends State<Tambah> {
  TextEditingController nama = TextEditingController();

  TextEditingController pilihobat = TextEditingController();

  TextEditingController pilihjenisobat = TextEditingController();

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
      backgroundColor:  Color.fromARGB(255, 245, 242, 242),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 242, 242),
        elevation: 0,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minHeight: constraints.maxHeight,
              maxHeight: double.infinity,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama Pasien',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 124, 123, 123),
                          ),
                        ),
                        TextFormField(
                          cursorColor: const Color(0xff4E944F),
                          autofocus: false,
                          controller: nama,
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 124, 123, 123)),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff4E944F)),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Pilih Nama Obat',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Pilih obat',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 124, 123, 123),
                          ),
                        ),
                        TextFormField(
                          cursorColor: const Color(0xff4E944F),
                          autofocus: false,
                          controller: pilihobat,
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 124, 123, 123)),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff4E944F)),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Pilih jenis obat',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 124, 123, 123),
                          ),
                        ),
                        TextFormField(
                          cursorColor: const Color(0xff4E944F),
                          autofocus: false,
                          controller: pilihjenisobat,
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 124, 123, 123)),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff4E944F)),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    'Subtotal',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Rp. 10.000',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
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
                                            primary: const Color(0xff4E944F)),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Invoice()),
                                          );
                                        },
                                        child: const Text(
                                          "TAMBAH",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       'Tambah',
    //       style: TextStyle(
    //         fontSize: 18,
    //         color: Colors.black,
    //       ),
    //     ),
    //     backgroundColor: Colors.white,
    //     elevation: 0,
    //   ),

    //   // body: ListView(
    //   //   children: [
    // Padding(
    //   padding: const EdgeInsets.all(25.0),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         'Nama Pasien',
    //         style: TextStyle(
    //           fontSize: 16,
    //           color: Color.fromARGB(255, 124, 123, 123),
    //         ),
    //       ),
    //       TextFormField(
    //         cursorColor: const Color(0xff4E944F),
    //         autofocus: false,
    //         controller: nama,
    //         decoration: InputDecoration(
    //           labelStyle: const TextStyle(
    //               color: Color.fromARGB(255, 124, 123, 123)),
    //           focusedBorder: const UnderlineInputBorder(
    //             borderSide: BorderSide(color: Color(0xff4E944F)),
    //           ),
    //         ),
    //       ),
    //       SizedBox(height: 40),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         // ignore: prefer_const_literals_to_create_immutables
    //         children: [
    //           Text(
    //             'Pilih Nama Obat',
    //             style: TextStyle(
    //               fontSize: 20,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //         ],
    //       ),
    //       SizedBox(height: 30),
    //       Text(
    //         'Pilih obat',
    //         style: TextStyle(
    //           fontSize: 16,
    //           color: Color.fromARGB(255, 124, 123, 123),
    //         ),
    //       ),
    //       TextFormField(
    //         cursorColor: const Color(0xff4E944F),
    //         autofocus: false,
    //         controller: pilihobat,
    //         decoration: InputDecoration(
    //           labelStyle: const TextStyle(
    //               color: Color.fromARGB(255, 124, 123, 123)),
    //           focusedBorder: const UnderlineInputBorder(
    //             borderSide: BorderSide(color: Color(0xff4E944F)),
    //           ),
    //         ),
    //       ),
    //       SizedBox(height: 30),
    //       Text(
    //         'Pilih jenis obat',
    //         style: TextStyle(
    //           fontSize: 16,
    //           color: Color.fromARGB(255, 124, 123, 123),
    //         ),
    //       ),
    //       TextFormField(
    //         cursorColor: const Color(0xff4E944F),
    //         autofocus: false,
    //         controller: pilihjenisobat,
    //         decoration: InputDecoration(
    //           labelStyle: const TextStyle(
    //               color: Color.fromARGB(255, 124, 123, 123)),
    //           focusedBorder: const UnderlineInputBorder(
    //             borderSide: BorderSide(color: Color(0xff4E944F)),
    //           ),
    //         ),
    //       ),
    //       SizedBox(height: 50),
    //       loading
    //           ? const CircularProgressIndicator(
    //               valueColor:
    //                   AlwaysStoppedAnimation<Color>(Color(0xff4E944F)))
    //           : SizedBox(
    //               height: 45,
    //               width: MediaQuery.of(context).size.width,
    //               child: ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                     elevation: 0, primary: const Color(0xff4E944F)),
    //                 onPressed: () {
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => percobaan()),
    //                   );
    //                 },
    //                 child: const Text(
    //                   "Daftar",
    //                   style: TextStyle(
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //       // SizedBox(height: 50),
    //     ],
    //   ),
    // ),
    //   //     Container(
    //   //       width: MediaQuery.of(context).size.width,
    //   //       height: 10,
    //   //       color: Colors.deepOrange,
    //   //     )
    //   //   ],
    //   // ),
    // );
  }
}
