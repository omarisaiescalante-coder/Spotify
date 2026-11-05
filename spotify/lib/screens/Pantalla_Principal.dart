import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
  backgroundColor: const Color.fromARGB(255, 25, 20, 20),
      
      appBar: AppBar(
  leading: const Center(
    child: CircleAvatar(
      radius: 16,
      backgroundColor: Color.fromARGB(255, 30, 255, 108),
      foregroundColor: Colors.black,
      child: Text('I'),
    ),
  ),
  title: const Text('Pruebas'),
  backgroundColor: const Color.fromARGB(255, 25, 20, 20),
  foregroundColor: const Color.fromARGB(255, 29, 185, 84),
),
      
    
  bottomNavigationBar:  BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.transparent,
  selectedItemColor: Colors.white,
  unselectedItemColor: Colors.grey,
  currentIndex: 0,
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: 'Inicio',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Buscar',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.library_music_outlined),
      label: 'Tu biblioteca',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: 'Más',
    ),
  ],
),
    );
  }
}