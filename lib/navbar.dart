import 'package:flutter/material.dart';
import 'package:lks_android/invoice.dart';
import 'package:lks_android/profil.dart';
import 'package:lks_android/tambah.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBarBottomAdmin(),
    );
  }
}

class NavBarBottomAdmin extends StatefulWidget {
  const NavBarBottomAdmin({Key? key}) : super(key: key);

  @override
  State<NavBarBottomAdmin> createState() => _NavBarBottomAdminState();
}

class _NavBarBottomAdminState extends State<NavBarBottomAdmin> {
  int _pilihanBottom = 0;

  final List<Widget> _children = [
    Tambah(),
    const Profil(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _pilihanBottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _children.elementAt(_pilihanBottom),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Transaksi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: _pilihanBottom,
        selectedItemColor: const Color(0xff4E944F),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
