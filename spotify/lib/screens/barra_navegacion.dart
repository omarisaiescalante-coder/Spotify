import 'package:flutter/material.dart';

class BarraNavegacion extends StatelessWidget {
  const BarraNavegacion({
    super.key,
    required this.indiceActual,
    required this.menuCrearAbierto,
    required this.onTap,
  });

  final int indiceActual;
  final bool menuCrearAbierto;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black, Colors.black],
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: indiceActual,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFFB3B3B3),
        selectedFontSize: 11,
        unselectedFontSize: 11,
        iconSize: 26,
        onTap: onTap,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Inicio',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.library_music_outlined),
            label: 'Tu biblioteca',
          ),
          BottomNavigationBarItem(
            icon: Opacity(
              opacity: menuCrearAbierto ? 0 : 1,
              child: const Icon(Icons.add),
            ),
            label: menuCrearAbierto ? '' : 'Crear',
          ),
        ],
      ),
    );
  }
}
