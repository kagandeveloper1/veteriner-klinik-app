import 'package:flutter/material.dart';
import 'ana_sayfa.dart';
import 'tohumlama.dart';
import 'hakkimda.dart';

void main() {
  runApp(const VeterinerApp());
}

class VeterinerApp extends StatelessWidget {
  const VeterinerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veteriner Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.green, 
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AnaEkran(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  int _seciliSayfaIndex = 0;

  
  final List<Widget> _sayfalar = [
    const AnaSayfa(),
    const TohumlamaSayfasi(),
    const HakkimdaSayfasi(),
  ];

  void _sayfaDegistir(int index) {
    setState(() {
      _seciliSayfaIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _sayfalar[_seciliSayfaIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _seciliSayfaIndex,
        onTap: _sayfaDegistir,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets), 
            label: 'Tohumlama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Özgeçmiş',
          ),
        ],
      ),
    );
  }
}
