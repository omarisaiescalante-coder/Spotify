import 'package:flutter/material.dart';

import 'Pantalla_buscar.dart';
import 'Pantalla_Biblioteca.dart';
import 'Pantalla_Principal.dart';

class PantallaBiblioteca extends StatelessWidget {
  const PantallaBiblioteca({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(9.0),
          child: CircleAvatar(
            backgroundColor: Colors.pinkAccent,
            child: Text('U', style: TextStyle(color: Colors.white)),
          ),
        ),
        title: const Text(
          'Tu biblioteca',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ), //si quiero cambiar el icono cambio el nombre de Add
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _crearBotonFiltro('Playlists'),
                const SizedBox(width: 8),
                _crearBotonFiltro('Artistas'),
                const SizedBox(width: 8),
                _crearBotonFiltro('Álbumes'),
                const SizedBox(width: 8),
                _crearBotonFiltro('Podcasts'),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.swap_vert, color: Colors.white70, size: 18),
                    SizedBox(width: 4),
                    Text(
                      'Recientes',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
                Icon(Icons.grid_view_rounded, color: Colors.white70, size: 18),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _crearElementoLista(
                  titulo: 'Tus canciones que te gustan',
                  subtitulo: 'Playlist • 142 canciones',
                  icono: Icons.favorite,
                  colorFondo: Colors.deepPurple,
                  esCircular: false,
                ),
                _crearElementoLista(
                  titulo: 'Bad Bunny',
                  subtitulo: 'Artista',
                  icono: Icons.person,
                  colorFondo: Colors.grey,
                  esCircular: true,
                ),
                _crearElementoLista(
                  titulo: 'Rock Clásico 80s',
                  subtitulo: 'Playlist • Tu usuario',
                  icono: Icons.music_note,
                  colorFondo: Colors.blueGrey,
                  esCircular: false,
                ),
                _crearElementoLista(
                  titulo: 'Sebastian Yatra',
                  subtitulo: 'Artista',
                  icono: Icons.person,
                  colorFondo: const Color.fromARGB(255, 21, 111, 33),
                  esCircular: true,
                ),
                _crearElementoLista(
                  titulo: 'Las mas escuchadas 2023',
                  subtitulo: 'Playlist • 94 canciones',
                  icono: Icons.headset,
                  colorFondo: const Color.fromARGB(255, 3, 111, 253),
                  esCircular: false,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF121212),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        onTap: (indice) {
          if (indice == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const PantallaPrincipal()),
            );
          } else if (indice == 1) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const PantallaBuscar()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music_outlined),
            label: 'Tu biblioteca',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Más'),
        ],
      ),
    );
  }

  //Clase que sera llamada arriba
  static Widget _crearBotonFiltro(String texto) {
    return Material(
      color: const Color(0xFF282828),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            texto,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ),
      ),
    );
  }

  //Clase que sera llamada arriba
  static Widget _crearElementoLista({
    required String titulo,
    required String subtitulo,
    required IconData icono,
    required Color colorFondo,
    required bool esCircular,
  }) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: colorFondo,
          shape: esCircular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: esCircular ? null : BorderRadius.circular(4),
        ),
        child: Icon(icono, color: Colors.white),
      ),
      title: Text(
        titulo,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitulo,
        style: const TextStyle(color: Colors.grey, fontSize: 13),
      ),
      onTap: () {},
    );
  }
}
